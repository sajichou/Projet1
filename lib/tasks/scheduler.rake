desc "This task is called by the Heroku scheduler add-on"


task :paye => :environment do

    # Amount in cents
    @amount = 1500
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


task :paiement_users => :environment do

  # Amount in cents
  @amount = 1500
  #On cherche les cours qui ont lieu demain reg 
  Cour.all.each do |cour|
    if (cour.date_reg.present? and !cour.date_ex.present?)
      puts "A"
      if (Date.today+1).strftime("%Y-%m-%d") == cour.date_reg
        puts "AA"
        #Parmi ces cours on trouve les dernieres lecons programmees
        cour.lessons.last.presences.each do |p|
          #Parmi les presences, on ne retient que les users qui n'ont pas encore payés
          if !p.perf
            begin
              puts "AAA"
              eleve = User.find(p.user_id)
              puts "cour id" + cour.id.to_s
              puts "eleve_id "+ eleve.id.to_s
              customer_id = Stripe_customer.where(user_id:eleve.id, cour_id:cour.id).last.stripe_customer_id
              #On les fait payer et on enregistre comme quoi ils ont payes
              description = "Cour de " + cour.teacher.email
              transfer_group = "Lesson " + cour.lessons.last.id.to_s
              charge = Stripe::Charge.create({
              #:customer    => eleve.infouser.stripe_customer_id,
              :customer    => customer_id,
              :amount      => @amount,
              :currency    => 'eur',
             # :on_behalf_of => cour.teacher.email,
              :transfer_group => transfer_group,
              :description => description,
              })
              p.update(perf:true, charge_id:charge.id)
              puts eleve.email + " a payé"
            rescue
              logger.error "Charging" + User.find(p.user_id.email)
            end
          end
        end
      end
  #On cherche les cours qui ont lieu demain ex
    elsif (cour.date_reg.present? and cour.date_ex.present?)
      puts "B"
      if (Date.today+1).strftime("%Y-%m-%d") == cour.date_ex
        puts "BB"
        cour.lessons.last.presences.each do |p|
          if !p.perf
            begin
              puts "BBB"
              eleve = User.find(p.user_id)
              customer_id = Stripe_customer.where(user_id:eleve.id, cour_id:cour.id).last.stripe_customer_id
              #On les fait payer et on enregistre comme quoi ils ont payes
              description = "Cour de " + cour.teacher.email
              transfer_group = "Lesson " + cour.lessons.last.id.to_s            
              charge = Stripe::Charge.create({
              :customer    => customer_id,
              :amount      => @amount,
              :currency    => 'eur',
             # :on_behalf_of => cour.teacher.email,
              :transfer_group => transfer_group,
              :description => description,           
              })
              p.update(perf:true, charge_id:charge.id)
              puts eleve.email + " a payé"
            rescue
              logger.error "Charging" + User.find(p.user_id.email)
            end
          end
        end
      end
    else
      puts "C"
    end
  end
end


task :paiement_teachers => :environment do

  #On cherche les cours qui ont lieu hier reg 
  Cour.all.each do |cour|
    if (cour.date_reg.present? and !cour.date_ex.present?)
      puts "A"
      puts cour.date_reg
      puts Date.today.strftime("%Y-%m-%d")
      if (Date.today-1).strftime("%Y-%m-%d") == cour.date_reg
        puts "AA"
        #Parmi ces cours on ceux qui ne signalent aucune complaint
        if (cour.lessons.last.complaints == 0 and !cour.lessons.last.paid)
          puts "AAA"
          begin
            #On paye le prof
            #On calcule le montant induit par le nombre de paiements recus pour cette lesson
            nb_paiements_recus = 0
            cour.lessons.last.presences.each do |p|
              if p.perf
                nb_paiements_recus += 1
              end
            end
            @amount = nb_paiements_recus * 1500
            description = "Votre cour du " + cour.date_reg
            transfer_group = "Lesson " + cour.lessons.last.id.to_s
            transfer = Stripe::Transfer.create({
            :amount      => @amount,
            :currency    => 'eur',
            :transfer_group => transfer_group,
            :description => description,
            :destination => cour.teacher.infoteacher.stripe_id
            })
            cour.lessons.last.update(paid:true)
            puts cour.teacher.email + " a été payé"
          rescue
            logger.error "Transfert" + Teacher.find(cour.teacher.email)
          end
        end
      end
  #On cherche les cours qui ont lieu hier ex
    elsif (cour.date_reg.present? and cour.date_ex.present?)
      puts "B"
      if (Date.today-1).strftime("%Y-%m-%d") == cour.date_ex
        puts "BB"
        if (cour.lessons.last.complaints == 0 and !cour.lessons.last.paid)
          puts "BBB"
          begin
            #On les fait payer et on enregistre comme quoi ils ont payes
            #On calcule le montant induit par le nombre de paiements recus pour cette lesson
            nb_paiements_recus = 0
            cour.lessons.last.presences.each do |p|
              if p.perf
                nb_paiements_recus += 1
              end
            end
            @amount = nb_paiements_recus * 1500

            description = "Votre cour du " + cour.date_reg
            transfer_group = "Lesson " + cour.lessons.last.id.to_s
            transfer = Stripe::Transfer.create({
            :amount      => @amount,
            :currency    => 'eur',
            :transfer_group => transfer_group,
            :description => description,
            :destination => cour.teacher.infoteacher.stripe_id
            })
            cour.lessons.last.update(paid:true)
            puts cour.teacher.email + " a été payé"
          rescue
            logger.error "Transfert" + Teacher.find(cour.teacher.email)
          end
        end
      end
    else
      puts "C"
    end
  end
end



task :rappel_avant_cours => :environment do
#24H avant le cours
  Cour.all.each do |cour|
  	if (cour.date_reg.present? and !cour.date_ex.present?)
  		if (Date.today+1).strftime("%Y-%m-%d") == cour.date_reg
        begin
          TeacherMailer.rappel_avant_cours(cour.teacher, cour).deliver
        rescue
          logger.error "TeacherMailer rappel_avant_cours " + cour.teacher.email
        end
  			cour.inscriptions.each do |inscription|
          begin
            UserMailer.rappel_avant_cours(User.find(inscription.user_id), cour).deliver
          rescue
            logger.error "UserMailer rappel_avant_cours " + User.find(inscription.user_id).email
          end
  		  end
      end
    elsif (cour.date_reg.present? and cour.date_ex.present?)
      if (Date.today+1).strftime("%Y-%m-%d") == cour.date_ex
        begin
          TeacherMailer.rappel_avant_cours(cour.teacher, cour).deliver
        rescue
          logger.error "TeacherMailer rappel_avant_cours " + cour.teacher.email
        end
        cour.inscriptions.each do |inscription|
          begin
            UserMailer.rappel_avant_cours(User.find(inscription.user_id), cour).deliver
          rescue
            logger.error "UserMailer rappel_avant_cours " + User.find(inscription.user_id).email
          end
        end
      end
  	end 	  	  	  	  		  	  	  	  		 	 	  	  	  	  	  	
  end
end

task :rappel_apres_cours_prof => :environment do
#1H apres le cours on maj la date_reg et le cas echeant on efface la date_ex
#On cree la nouvelle lesson et les presences 
  Cour.all.each do |cour|

    if (cour.date_reg.present? and !cour.date_ex.present?)
      puts "A"
      if (Date.today.strftime("%Y-%m-%d") == cour.date_reg and cour.heure <= (Time.now.utc.hour+2) and (Time.now.utc.hour+2) < (cour.heure + 1))
        puts "AA"
        #cour.inscriptions.each do |inscription|
        #  UserMailer.rappel_avant_cours(User.find(inscription.user_id), cour).deliver
        #end
        #On met à jour la date_reg
        wday = {"lundi"=>1, "mardi"=>2, "mercredi"=>3, "jeudi"=>4, "vendredi"=>5,
        "samedi"=>6, "dimanche"=>0}
        delta_jours = (wday[cour.jour] - Date.today.wday)
        if delta_jours <= 0 
          delta_jours += 7
        end
        date_reg = Date.today + delta_jours
        puts "nouvelle date_reg" + date_reg.to_s
        cour.update(date_reg:date_reg)
        #On cree la prochaine lesson
        lesson = Lesson.create cour_id:cour.id, complaints:0, paid:false, date:date_reg
        #On cree les presences en fonction des eleves inscrits
        cour.inscriptions.each do |inscription|
          Presence.create lesson_id:lesson.id, user_id:inscription.user_id, 
          perf:false
        end
        begin
          TeacherMailer.rappel_apres_cours(cour.teacher, cour).deliver
        rescue
          logger.error "TeacherMailer rappel_apres_cours " + cour.teacher.email
        end
      end

    elsif (cour.date_reg.present? and cour.date_ex.present?)
      if (Date.today.strftime("%Y-%m-%d") == cour.date_ex and cour.horaire_ex.to_f <= (Time.now.utc.hour+2) and (Time.now.utc.hour+2) < (cour.horaire_ex.to_f + 1))

       # cour.inscriptions.each do |inscription|
       #   UserMailer.rappel_apres_cours(User.find(inscription.user_id), cour).deliver
       # end
       # On met à jour la date_reg et la date_ex à nil
        wday = {"lundi"=>1, "mardi"=>2, "mercredi"=>3, "jeudi"=>4, "vendredi"=>5,
        "samedi"=>6, "dimanche"=>0}
        delta_jours = (wday[cour.jour] - Date.today.wday)
        if delta_jours <= 0 
          delta_jours += 7
        end
        date_reg = Date.today + delta_jours
        cour.update(date_reg:date_reg, date_ex:nil, horaire_ex:nil)
        lesson = Lesson.create cour_id:cour.id, complaints:0, paid:false, date:date_reg
        #On cree les presences en fonction des eleves inscrits
        cour.inscriptions.each do |inscription|
          Presence.create lesson_id:lesson.id, user_id:inscription.user_id, 
          perf:false
        end
        begin
          TeacherMailer.rappel_apres_cours(cour.teacher, cour).deliver
        rescue
          logger.error "TeacherMailer rappel_apres_cours " + cour.teacher.email
        end 
      end
    end                                                               
  end
end


task :settlement => :environment do

  Cour.all.each do |c|
    #On retient les dernieres lessons avec des litiges
    if c.lessons.last.complaints > 0
      #On retient ceux en faveurs des users
      if c.lessons.last.in_fav_of_users
        # On recupere les users associes a cette lesson
        Presence.where(lesson_id:c.lessons.last.id).each do |p|
          #On refund ces users qui ont payes 
          if p.perf
            refund = Stripe::Refund.create({
            charge: p.charge_id,
            amount: 15000,
            })
          end
        end
      end
    end
  end
end  
