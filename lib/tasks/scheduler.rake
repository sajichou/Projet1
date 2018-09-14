desc "This task is called by the Heroku scheduler add-on"


task :paye => :environment do

    # Amount in cents
    @amount = ENV["AMOUNT"].to_i
    #stripe_teacher_id = "ac_CvXOvyzEp3Oemjs3JVUFqj2Grc6Vg8F4"
    stripe_teacher_id = "acct_1CVgoxChvnMxBQel"

    #stripe_customer_id = "cus_CvWlzILiYEJMJK"
    stripe_customer_id = "cus_CvY7ESq5i47KwS"

    charge = Stripe::Charge.create(
      :customer    => stripe_customer_id,
      :amount      => @amount,
      :description => 'Rails Stripe Connect',
      :currency    => 'eur',
      :destination => {
        :amount => 100,
        :account => stripe_teacher_id,
     }
    )

end

task :email => :environment do

  #UserMailer.signup(User.find(77)).deliver
  
  #UserMailer.signup(User.find(30)).deliver
  #UserMailer.signup(User.find(29)).deliver

  UserMailer.signup(User.find(68)).deliver


end


task :paiement => :environment do 
  ### On parcourt les lessons non payées et passées et on fait payer les élèves qui 
  #### qui n'ont pas encore payés, sans quoi on inscrit une alerte

  @amount = ENV["AMOUNT"].to_i
  wday = {"lundi"=>1, "mardi"=>2, "mercredi"=>3, "jeudi"=>4, "vendredi"=>5,
        "samedi"=>6, "dimanche"=>0}
  #auj = Time.zone.now.strftime("%d-%m-%Y") #jj/mm/YYYY
  auj = Time.zone.today
  heure_auj = Time.zone.now.hour
  #On selectionne les lessons non payées
  Lesson.where(paid:false).each do |lesson|
    #On formate la date du cours 
    if lesson.cour.date_ex.present?
      date = lesson.date.to_date
      heure = lesson.cour.horaire_ex
    else
      date = lesson.date.to_date
      heure = lesson.cour.heure
    end
    #On retient les lessons passées 
    if (date <= auj and heure < heure_auj)
      
      #Calcul de la réménuration de l'enseignant selon le nb d eleves censés être présents a la lecon
      nb_eleves = lesson.presences.length
      if nb_eleves == 1 
        @commission = ENV["COMMISSION1"].to_f
      elsif nb_eleves == 2 
        @commission = ENV["COMMISSION2"].to_f
      elsif nb_eleves == 3
        @commission = ENV["COMMISSION3"].to_f
      end 
      @amount_prof = (@amount*(1-@commission/100)).to_i

      #On procede au paiement de chaque eleve et on enregistre dans son historique de paiement
      lesson.presences.each do |presence|
        #Paiement de chaque eleve qui n'a pas encore payé
        if (!presence.perf and !presence.absence)
          stripe_customer_id = StripeCustomer.where(user_id:presence.user_id, cour_id:lesson.cour.id).last.stripe_customer_id
          stripe_teacher_id = lesson.cour.teacher.infoteacher.stripe_id
          description = "Kamaraderie - Cour de " + lesson.cour.teacher.infoteacher.first_name
          #On calcule le montant net que doit payer l eleve en fonction de ses codes promos
          if (User.find(presence.user_id).infouser.code == "LANCEMENT18" and !User.find(presence.user_id).infouser.code_used and nb_eleves > 1) 
            amount_eleve = (0.8*@amount).to_i
          else
            amount_eleve = @amount
          end
          begin
          puts "charge"
          charge = Stripe::Charge.create(
          :customer    => stripe_customer_id,
          :amount      => amount_eleve,
          :description => description,
          :currency    => 'eur',
          :metadata => {
            'eleve' => User.find(presence.user_id).email, 
            'professeur'=> Teacher.find(lesson.cour.teacher.id).email,
            'lesson_id' => lesson.id,
            },
          :destination => {
            :amount => @amount_prof,
            :account => stripe_teacher_id,
            }
          )
          Paiement.create(
            user_id:presence.user_id, 
            teacher_id:lesson.cour.teacher.id, 
            lesson_id:lesson.id,
            amount_prof: @amount_prof,
            amount_eleve: amount_eleve,
            created_at:Time.zone.now,
            )
          presence.update(perf:true, stripe_charge:charge.id)
          rescue
            puts "ERRRRRRRROR DE PAIEMENT"
          end
        end
      end
      #On compte le nombre de paiements effectues
      nb_paiements = lesson.presences.where(perf:true).length
      #On indique que la lecon a été entierement payee si nb_paiements = nb_eleves
      if nb_paiements == nb_eleves
        lesson.update(paid:true)
      else
        if !Alerte.find_by_lesson_id(lesson.id).present?
          Alerte.create(lesson_id:lesson.id, error:true)
        end
      end 

    end

  end
end

task :maj_cours => :environment do
  ### On update la date des cours passés et on cree la nouvelle lesson 
  wday = {"lundi"=>1, "mardi"=>2, "mercredi"=>3, "jeudi"=>4, "vendredi"=>5,
        "samedi"=>6, "dimanche"=>0}
  auj = Time.zone.today
  heure_auj = Time.zone.now.hour
  Cour.where("nombre_eleves>?",0).each do |cour|

    if cour.date_ex.present?
      date = cour.date_ex.to_date
      heure = cour.horaire_ex
    else
      date = cour.date_reg.to_date
      heure = cour.heure
    end

    if (date <= auj and heure < heure_auj)

      delta_jours = (wday[cour.jour] - auj.wday)
      if delta_jours <= 0 
        delta_jours += 7
      end
      date_reg = auj + delta_jours

      cour.update(date_ex:nil, horaire_ex:nil, min_ex:nil, date_reg:date_reg)
      lesson = Lesson.create(cour_id:cour.id, date:date_reg, paid:false)
      #On cree les presences par default des eleves inscrits
      Inscription.where(cour_id:cour.id).each do |inscription|
        Presence.create(lesson_id:lesson.id, user_id:inscription.user_id, perf:false)
      end
    end

  end
end

task :faux_maj_cours => :environment do
  ### On update la date des cours passés et on cree la nouvelle lesson 
  wday = {"lundi"=>1, "mardi"=>2, "mercredi"=>3, "jeudi"=>4, "vendredi"=>5,
        "samedi"=>6, "dimanche"=>0}
  auj = Time.zone.today
  heure_auj = Time.zone.now.hour
  Cour.where("nombre_eleves>?",0).each do |cour|

    if cour.date_ex.present?
      date = cour.date_ex.to_date
      heure = cour.horaire_ex
    else
      date = cour.date_reg.to_date
      heure = cour.heure
    end

    if (date > auj)

      date_reg = auj + 7

      cour.update(date_ex:nil, horaire_ex:nil, min_ex:nil, date_reg:date_reg)
      lesson = Lesson.create(cour_id:cour.id, date:date_reg, paid:false)
      #On cree les presences par default des eleves inscrits
      Inscription.where(cour_id:cour.id).each do |inscription|
        Presence.create(lesson_id:lesson.id, user_id:inscription.user_id, perf:false)
      end
    end

  end
end

###Paiement pour tests

task :paiement_test => :environment do 
  ### On parcourt les lessons non payées et passées et on fait payer les élèves qui 
  #### qui n'ont pas encore payés, sans quoi on inscrit une alerte

  @amount = ENV["AMOUNT"].to_i
  wday = {"lundi"=>1, "mardi"=>2, "mercredi"=>3, "jeudi"=>4, "vendredi"=>5,
        "samedi"=>6, "dimanche"=>0}
  #auj = Time.zone.now.strftime("%d-%m-%Y") #jj/mm/YYYY
  auj = Time.zone.today
  heure_auj = Time.zone.now.hour
  #On selectionne les lessons non payées
  Lesson.where(paid:false).each do |lesson|
    puts "lesson_id"
    puts lesson.id
    #On formate la date du cours 
    if lesson.cour.date_ex.present?
      date = lesson.date.to_date
      heure = lesson.cour.horaire_ex
    else
      date = lesson.date.to_date
      heure = lesson.cour.heure
    end
    puts  "AAA"
    #On retient les lessons passées 
    puts "date"
    puts date
    puts "auj"
    puts auj
    if (date > auj)
      puts "BBB"


      #Calcul de la réménuration de l'enseignant selon le nb d eleves censés être présents a la lecon
      nb_eleves = lesson.presences.length
      puts"nb eleves"
      puts nb_eleves
      if nb_eleves == 1 
        amount_prof = ENV["REM1"].to_i
      elsif nb_eleves == 2 
        amount_prof = (ENV["REM2"].to_f/2).to_i
      elsif nb_eleves == 3
        amount_prof = (ENV["REM3"].to_f/3).to_i
      end 

      #On procede au paiement de chaque eleve et on enregistre dans son historique de paiement
      lesson.presences.each do |presence|

        #Paiement de chaque eleve qui n'a pas encore payé
        if (!presence.perf and !presence.absence)
          puts "amount prof"
          puts amount_prof
          #begin

          stripe_customer_id = StripeCustomer.where(user_id:presence.user_id, cour_id:lesson.cour.id).last.stripe_customer_id
          stripe_teacher_id = lesson.cour.teacher.infoteacher.stripe_id
          description = "TopNote - Cour de " + lesson.cour.teacher.infoteacher.first_name
          #On calcule le montant net que doit payer l eleve en fonction de ses codes promos
          if (User.find(presence.user_id).infouser.code == "LANCEMENT18" and !User.find(presence.user_id).infouser.code_used and nb_eleves > 1) 
            amount_eleve = (0.8*@amount).to_i
          else
            amount_eleve = @amount
          end
          puts"amount_eleve"
          puts amount_eleve
          puts "charge"
          charge = Stripe::Charge.create(
          :customer    => stripe_customer_id,
          :amount      => amount_eleve,
          :description => description,
          :currency    => 'eur',
          :metadata => {
            'eleve' => User.find(presence.user_id).email, 
            'professeur'=> Teacher.find(lesson.cour.teacher.id).email,
            'lesson_id' => lesson.id,
            },
          :destination => {
            :amount => amount_prof,
            :account => stripe_teacher_id,
            }
          )
          Paiement.create(
            user_id:presence.user_id, 
            teacher_id:lesson.cour.teacher.id, 
            lesson_id:lesson.id,
            amount_prof: amount_prof,
            amount_eleve: amount_eleve,
            created_at:Time.zone.now,
            )
          presence.update(perf:true, stripe_charge:charge.id)
          #rescue
           # puts "ERRRRRRRROR DE PAIEMENT"
          #end
        end
      end
      #On compte le nombre de paiements effectues
      nb_paiements = lesson.presences.where(perf:true).length
      #On indique que la lecon a été entierement payee si nb_paiements = nb_eleves
      if nb_paiements == nb_eleves
        lesson.update(paid:true)
      else
        if !Alerte.find_by_lesson_id(lesson.id).present?
          Alerte.create(lesson_id:lesson.id, error:true)
        end
      end 

    end

  end
end


task :paiement_test_init => :environment do
  Lesson.where(paid:true).each do |lesson|
    lesson.update(paid:false)
    lesson.presences.each do |p|
      p.update(perf:false)
    end
  end
end