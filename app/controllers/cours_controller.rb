class CoursController < ApplicationController

  before_action :authenticate_user! ,only: [:inscription]
  before_action :premier_eleve ,only: [:inscription]
  before_action :authenticate_teacher! ,only: [:new, :create, :destroy]
  before_action :teacher_validated, only: [:create, :new,:destroy]



  def index
     @cours = Cour.page(params[:page]).per(20)
  end

  def create
  end

  def overlay
  end

  def new

    # Si creneau non renseigne
    if(!params[:jour].present? or !params[:heure].present?)
      redirect_to '/cours/create'
      flash[:info] ="Veuillez indiquer au moins un créneau pour ce cours."
    # Si niveau non renseigne
    elsif(!params[:classe].present?)
      redirect_to '/cours/create'
      flash[:info] ="Veuillez indiquer au moins un niveau d'étude pour ce cours."
    # Si adresse reconnue 
    elsif (params[:latitude].present? and params[:longitude].present?)
      cour = Cour.create teacher_id:current_teacher.id, matiere:params[:matiere], lieu:params[:lieu],
       latitude:params[:latitude], longitude:params[:longitude], descriptif:params[:descriptif], street_number:params[:street_number], route:params[:route],
       locality:params[:locality], postal_code:params[:postal_code], country:params[:country]
      params[:classe].each do |c|
        Annee.create cour_id:cour.id, teacher_id:current_teacher.id, niveau:c
      end

      3.times do |i|
        if params[:jour][i].present?
          horaire = params[:heure][i].split(":")
          heure = horaire[0].to_i
          min = horaire[1].to_i
          Dispo.create cour_id:cour.id, jour:params[:jour][i], heure:heure, min:min
        end
      end

      if cour.dispos.length == 1
        cour.update(jour:cour.dispos.first.jour, heure:cour.dispos.first.heure, 
          min:cour.dispos.first.min)
      end
      #Lesson.create cour_id:cour.id, complaints:0, paid:false
      #cours.latitude =  Geocoder.coordinates(params[:lieu])[0]
      #cours.longitude = Geocoder.coordinates(params[:lieu])[1]
      #sleep (3)
      redirect_to "/pages/monespace"

      #Si adresse non reconnue
    else
      redirect_to '/cours/create'
      flash[:info] ="Votre adresse n'est pas reconnue"
    end

  end

  def show

    if params[:id].present?
      @cour = Cour.find(params[:id])
      session[:page_id] = params[:id]
    else
      @cour = Cour.find(session[:page_id])
    end
    #@cour = Cour.find(params[:id])
    if Inscription.where(cour_id:@cour.id, user_id:current_user).length > 0
      @est_inscrit = true
    else
      @est_inscrit = false
    end

    # Si plusieurs créneaux disponibles :

    if @cour.dispos.length >1
      l = []
      @cour.dispos.each do |jh|
        unless l.include? (jh.jour) 
          l.push(jh.jour)
        end 
      end

      l_ord = []
      while l.length >= 1
          l.length.times do |i|
            bool = true
            l.length.times do |j|
              bool = MinJour(l[i],l[j])
            end
            if bool 
              l_ord.push(l[i])
              l.delete_at(i)
              break
            end
          end
      end
      @l=l_ord
    end

    if @est_inscrit
      redirect_to controller: 'cours', action: 'show_inscrit', id: @cour.id

    elsif (teacher_signed_in? and @cour.teacher.id == current_teacher.id)

      redirect_to controller: 'cours', action: 'show_prof', id: @cour.id
    
    end

  end

  def show_inscrit
    @est_inscrit=true
    @cour = Cour.find(params[:id])
    @messages = Contactmessage.where(user_id:current_user.id, 
      teacher_id:@cour.teacher.id, cour_id:@cour.id)

    if Absencesponctuelle.where(user_id:current_user.id, cour_id:params[:id]).length < 1
      date_derniere_abs = 0
    else
      derniere_abs = Absencesponctuelle.where(user_id:current_user.id, cour_id:params[:id]).last
      date_derniere_abs = Lesson.find(derniere_abs.lesson_id).date.to_date
    end

    if (Time.zone.today - date_derniere_abs) < 30
      @absenceponctuelle = true
    else
      @absenceponctuelle = false
    end

  end

  def show_prof
    @cour = Cour.find(params[:id])
    date = Time.zone.today
    @absents = []
    Absencesponctuelle.where(cour_id:params[:id]).each do |a|
      if Lesson.find(a.lesson_id).date.to_date >= date
        @absents.push(a.user_id)
      end
    end
  end

  def update
  end

  def destroy
    cour = Cour.find(params[:id]).destroy
    inscriptions = Inscription.where(cour_id: params[:id])
    inscriptions.each do |i|
      i.destroy
    end
    if (cour.lessons.last.present? and cour.lessons.last.presences.present? and !cour.lessons.last.paid)
      puts "suppression"
      cour.lessons.last.presences.each do |p|
        if (!p.perf)
          p.destroy 
        end
      end
    end
    redirect_to '/pages/monespace'
  end

  def accueil

  end

  def search

    niveau = params[:classe].to_i
    if niveau.present?
      @niveau = niveau
    end
    #@cours = Cour.where("matiere=? AND nombre_eleves < ?  ", params[:matiere], 3)
    if params[:matiere].present?
      @cours = Cour.where("matiere=?", params[:matiere])
      @matiere= params[:matiere]
    else
      #matiere non renseignee
      @cours = Cour.all
    end

    #Classe non renseignee
    if niveau != 0
      liste = []
      @cours.each do |cg|
        cg.annees.each do |cp|
          if(cp.niveau == niveau || cp.niveau == 13)
            liste.push(cg)
          end
        end
      end
      @cours = liste
    end
    @lieu = params[:lieu]
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    if latitude == 0
      latitude = 48.87
      longitude = 2.30
    end
    @dist_hash = {}
    @dist = {}
    @cours.each do |c|
    a = 0
    if(c.latitude.present? and c.longitude.present?)
   # a = Geocoder::Calculations.distance_between([c.latitude, c.longitude], @lieu, :units =>:km).round(2)
      a = Haversine.distance(c.latitude, c.longitude, latitude, longitude).to_kilometers.round(2)

    end
      @dist_hash[c] = a
      @dist[c.id] = a
    end

    @cours=[]
    @dist_hash_trie = @dist_hash.sort_by {|_key, value| value}
    @dist_hash_trie.each do |d|
      @cours.push(d[0])
    end

  end


  def inscription
    cour = Cour.find(params[:id])
    begin
      if cour.nombre_eleves < 3
        cour.nombre_eleves = cour.nombre_eleves + 1
        #Si premier inscrit alors le niveau du cours est celui de l'élève mais encore faut-il que l'élève ait 
        #renseigné sa classe lors de son inscription => before action premier_eleve
          if cour.nombre_eleves < 2
            cour.annees.each do |a|
              a.destroy
            end
            Annee.create cour_id:cour.id, teacher_id:cour.teacher_id, niveau:current_user.infouser.niveau
            cour.dispos.each do |a|
              a.destroy
            end
            
            if !cour.jour or !cour.heure or !cour.min
              dispo = params[:dispo].split(",")
              dispo[1] = dispo[1].to_i
              dispo[2] = dispo[2].to_i
              Dispo.create cour_id:cour.id, jour:dispo[0], heure:dispo[1], min:dispo[2]
              cour.update(jour:dispo[0])
              cour.update(heure:dispo[1])
              cour.update(min:dispo[2])
            end

            #On calcule la date reguliere
            wday = {"lundi"=>1, "mardi"=>2, "mercredi"=>3, "jeudi"=>4, "vendredi"=>5,
            "samedi"=>6, "dimanche"=>0}
            delta_jours = (wday[cour.jour] - Date.today.wday)
            if delta_jours < 0 
              delta_jours += 7
            end
            date_reg = Date.today + delta_jours
            #On decale d'une semaine si l'eleve s'inscrit moins de 24h avant le début du cours
            if delta_jours < 2
              date_reg += 7
            end
          
            cour.update(date_reg:date_reg, objectif:params[:objectif].to_i)
            #On cree la lesson et la presence associee
            #Lesson.create cour_id:cour.id, date:date_reg
            lesson = Lesson.create(cour_id:cour.id, date:date_reg,paid:false)
            lesson.save
            #On renseigne les choix de chapitres du 1er inscrit
            if params[:topics].present?
              eval(params[:topics]).each do |t|
                Chapitre.create(lesson_id:lesson.id, cour_id:cour.id, topic_id:t)
              end
              liste_themes = []
              eval(params[:topics]).each do |c|
                if !liste_themes.include? Topic.find(c).theme  
                    liste_themes.push(Topic.find(c).theme)
                end 
              end
              cour.update(theme:liste_themes)

            end

          end
        cour.save
        
        Inscription.create user_id:current_user.id, cour_id:cour.id
        Presence.create lesson_id:cour.lessons.last.id, user_id:current_user.id, perf:false


        @twilio_number = ENV['TWILIO_NUMBER']
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        @client = Twilio::REST::Client.new(account_sid, ENV['TWILIO_AUTH_TOKEN'])
        teacher_phone = "+33" + Cour.find(cour.id).teacher.infoteacher.phone
        twilio_phone_number = "TopNote"
        #time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
        #reminder = "Hi #{self.name}. Just a reminder that you have an appointment coming up at #{time_str}."
        reminder = "Hello, un nouvel élève s'est inscrit à votre cours ! "
        message = @client.api.account.messages.create(
          #:from => '+33644640536',
          :from =>twilio_phone_number,
          #:to => self.phone_number,
          :to => teacher_phone,
          :body => reminder,
        )

        UserMailer.inscription(current_user, cour).deliver
        TeacherMailer.inscription(cour.teacher,cour,current_user, params[:topics]).deliver
        redirect_to '/pages/monespace'
      else
        redirect_to controller: 'cours', action: 'show', id: params[:id]
        flash[:info] = "Ce cours est complet."
      end

    rescue 
      flash[:info] = "Une erreur est survenue, vous ne serez pas débité." 
      render :accueil
    end

  end

  def accepter_inscription
    user = User.find(params[:user_id])
    cour = Cour.find(params[:cour_id])
   # Demande.find(params[:demande_id]).update(state:true)
   # demande = Demande.find(params[:demande_id])

    if cour.nombre_eleves < 3
    cour.nombre_eleves = cour.nombre_eleves + 1
    #Si premier inscrit alors le niveau du cours est celui de l'élève mais encore faut-il que l'élève ait 
    #renseigné sa classe lors de son inscription => before action premier_eleve
      if cour.nombre_eleves < 2
        cour.annees.each do |a|
          a.destroy
        end
        Annee.create cour_id:cour.id, teacher_id:cour.teacher_id, niveau:user.infouser.niveau
        cour.dispos.each do |a|
          a.destroy
        end
        
        if !cour.jour.present? or !cour.heure.present? or !cour.min.present?
          cour.update(jour:demande.jour,heure:demande.heure,min:demande.min)
          cour.save
        end

        #On calcule la date reguliere
        wday = {"lundi"=>1, "mardi"=>2, "mercredi"=>3, "jeudi"=>4, "vendredi"=>5,
        "samedi"=>6, "dimanche"=>0}
        delta_jours = (wday[cour.jour] - Time.zone.today.wday)
        if delta_jours < 0 
          delta_jours += 7
        end
        date_reg = Time.zone.today + delta_jours
        #Conversion implicite de la date au format 2018-05-04: strftime("%Y-%m-%d")
        cour.update(date_reg:date_reg)
        cour.save
        #On cree la lesson et la presence associee
        #Lesson.find_by_cour_id(cour.id).update(date:date_reg)
        Lesson.create(cour_id:cour.id, date:date_reg,paid:false)
      end
      
      Inscription.create user_id:user.id, cour_id:cour.id
      Presence.create lesson_id:cour.lessons.last.id, user_id:user.id, perf:false

      UserMailer.inscription(user, cour).deliver
      TeacherMailer.inscription(cour.teacher,cour,user).deliver
      redirect_to '/pages/monespace'
      flash[:info] = "Vous avez un nouveau cours!"
    else
      puts "cours complet"
      redirect_to controller: 'cours', action: 'show', id: params[:cour_id]
      flash[:info] = "Ce cours est complet."
    end

  end

  def refuser_inscription
    Demande.find(params[:demande_id]).update(state:false)
    redirect_to controller: 'pages', action: 'monespace'
  end


  def modifier

  end

  def modifier_ex_def

    wday = {"lundi"=>1, "mardi"=>2, "mercredi"=>3, "jeudi"=>4, "vendredi"=>5,
    "samedi"=>6, "dimanche"=>0}
    cour = Cour.find(params[:id])
    if params[:modifier_ex]
      date_ex = params[:datepicker]
      time = params[:timepicker].split(":")
      horaire_ex = time[0].to_i
      min_ex = time[1].to_i
      cour.update(date_ex:date_ex, horaire_ex:horaire_ex, min_ex:min_ex)
      cour.save
      if cour.lessons.last.present?
        cour.lessons.last.update(date:date_ex)
      end
      cour.inscriptions.each do |i|
        UserMailer.modifier_ex(cour,User.find(i.user_id)).deliver
      end

    else
      jour = params[:jour]
      time = params[:timepicker_def].split(":")
      heure = time[0].to_i
      min = time[1].to_i
      delta_jours = (wday[jour] - Date.today.wday)
      if delta_jours < 0 
        delta_jours += 7
      end
      date_reg = Date.today + delta_jours
      cour.update(jour:jour, heure:heure, min:min, date_reg:date_reg)
      cour.save
      if cour.lessons.last.present? and !cour.lessons.last.paid
        cour.lessons.last.update(date:date_reg)
      end
    end
    #UserMailer.modifier(Cour.find(params[:id])).deliver
    #TeacherMailer.inscription(Cour.find(params[:id]).teacher).deliver
    redirect_to controller: 'cours', action:'show_prof', id:params[:id]
  end

  def contacter_prof
    if params[:contactprof]
        if user_signed_in?
          #Sauvergarder le message envoye
          message = Contactmessage.create cour_id:params[:cour_id], user_id:current_user.id, message:params[:message], teacher_id:Cour.find(params[:cour_id]).teacher_id, ecritparuser:true
          message.save
          Notification.create recipient:message.teacher, actor:current_user, action:"envoyé", notifiable:message
          #Envoyer une notification au prof 
          teacher = Cour.find(params[:cour_id]).teacher
          #On envoie une demande par SMS
          @twilio_number = ENV['TWILIO_NUMBER']
          account_sid = ENV['TWILIO_ACCOUNT_SID']
          @client = Twilio::REST::Client.new(account_sid, ENV['TWILIO_AUTH_TOKEN'])
          teacher_phone = "+33" + message.teacher.infoteacher.phone
          twilio_phone_number = "TopNote"
          #time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
          #reminder = "Hi #{self.name}. Just a reminder that you have an appointment coming up at #{time_str}."
          reminder = "Hello, "+ message.teacher.infoteacher.first_name + " vous a envoyé un message. 
          Rendez-vous sur votre espace personnel pour le lire."
          message = @client.api.account.messages.create(
            #:from => '+33644640536',
            :from =>twilio_phone_number,
            #:to => self.phone_number,
            :to => teacher_phone,
            :body => reminder,
          )
          TeacherMailer.contact(teacher,current_user).deliver
          redirect_to controller: 'cours', action:'show', id:params[:cour_id]

        else
          flash[:info] = "Vous devez d'abord vous connecter."
          redirect_to controller: 'cours', action:'show', id:params[:cour_id]
        end
    elsif params[:commit]
      redirect_to controller: 'charges', action:'new', id:params[:id], dispo:params[:dispo], 
      objectif:params[:objectif], topics:params[:topics]
    elsif params[:commentaire]
      cour_id = params[:cour_id]
      now = Time.zone.now
      Inscription.where(cour_id:cour_id).each do |i|
        id = i.user_id.to_s
        if params[id]["commentaire"].present?
          puts params[id].inspect
          Commentaire.create(
            user_id:i.user_id, 
            cour_id:cour_id, 
            date:params[id]["datepicker"],
            contenu:params[id]["commentaire"],
            created_at:now)
          UserMailer.commentaire(User.find(i.user_id),Cour.find(cour_id),params[id]["commentaire"].last, params[id]["datepicker"].last).deliver
        end
      end
      redirect_to controller: 'cours', action:'show', id:params[:cour_id]
    end
  end

  def maj

    cour = Cour.find(params[:cour_id])
    if params[:submit_theme].present?
      cour.update(theme:params[:themes])
      Chapitres.where(lesson_id:cour.lessons.last.id, paid:false).each do |c|
        c.destroy
      end
      redirect_to controller: 'cours', action:'show', id:params[:cour_id]
    elsif params[:modifier_ex].present?

      redirect_to controller: 'cours', action:'modifier_ex_def', id:params[:cour_id],
      datepicker:params[:datepicker], timepicker:params[:timepicker], 
      modifier_ex:params[:modifier_ex]
    elsif params[:modifier_def].present?

      redirect_to controller: 'cours', action:'modifier_ex_def', id:params[:cour_id],
      jour:params[:jour], timepicker_def:params[:timepicker_def], 
      modifier_def:params[:modifier_def]

    end

  end



private

  def teacher_complet(teacher)

    teacher.infoteacher.first_name.present? and teacher.infoteacher.last_name.present? and teacher.infoteacher.dptm.present? and
    teacher.infoteacher.email.present?  and teacher.infoteacher.stripe_id.present? and
    teacher.infoteacher.experience.present? and teacher.infoteacher.methodology.present? and teacher.infoteacher.phone.present?
  
  end

  def teacher_validated
    #unless (teacher_signed_in? and Role.where(teacher_id: current_teacher.id).last.power==1)
      #redirect_to '/teachers/sign_in'
   # end

    if (!teacher_signed_in?)
      redirect_to '/teachers/sign_in'
    elsif (teacher_signed_in? and !teacher_complet(current_teacher) and Role.where(teacher_id: current_teacher.id).last.power==0)
      flash[:info] = "Vous devez d'abord terminer votre inscription. Vous recevrez ensuite un mail de validation"
      redirect_to '/pages/monprofil/'
    elsif (teacher_signed_in? and teacher_complet(current_teacher) and Role.where(teacher_id: current_teacher.id).last.power==0)
      flash[:info] = "Nous allons vous contacter sous 24h pour valider votre compte. Vous pourrez ensuite créer des annonces :)"
      redirect_to '/cours/accueil/'
    end

  end

  def premier_eleve
    cour = Cour.find(params[:id])
    #On peut verifier que l eleve a bien renseigné sa classe mais on pourrait aussi bien tout vérifier
    if (cour.nombre_eleves < 1 and !current_user.infouser.niveau.present?)
      flash[:info] = "Vous devez d'abord terminer votre inscription"
      redirect_to '/pages/monprofil/'
    end
  end

  def MinJour (j1,j2)
    hash_jours = {"lundi":1, "mardi":2, "mercredi":3, "jeudi":4, "vendredi":5, "samedi":6, "dimanche":7} 
    #puts hash_jours[j1.to_sym]
    if(hash_jours[j1.to_sym] <= hash_jours[j2.to_sym])
      return true
    else
      return false
    end
  end

end
