class CoursController < ApplicationController

  before_action :authenticate_user! ,only: [:inscription]
  before_action :premier_eleve ,only: [:inscription]
  before_action :authenticate_teacher! ,only: [:new, :create, :destroy]
  #before_action :teacher_validated, only: [:create, :new,:destroy]



  def index
     @cours = Cour.page(params[:page]).per(20)
  end

  def create
  end

  def new

    # Si adresse reconnue 
    if (params[:latitude].present? and params[:longitude].present?)
      cour = Cour.create teacher_id:current_teacher.id, matiere:params[:matiere], lieu:params[:lieu],
       latitude:params[:latitude], longitude:params[:longitude], titre:params[:titre], descriptif:params[:descriptif]
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
      Lesson.create cour_id:cour.id, complaints:0, paid:false
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
    @inscriptions = Inscription.where("cour_id=?",@cour.id)
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

  end

  def update
  end

  def destroy
    cour = Cour.find(params[:id]).destroy
    inscriptions = Inscription.where(cour_id: params[:id])
    inscriptions.each do |i|
      i.destroy
    end
    if (cour.lessons.last.present? and cour.lessons.last.presences.present?)
      puts "suppression"
      cour.lessons.last.presences.each do |p|
        puts !p.perf
        if (p.user_id == current_user.id and !p.perf)
          puts "ici"
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
    #@cours = Cour.where("matiere=? AND nombre_eleves < ?  ", params[:matiere], 3)
    if params[:matiere].present?
      @cours = Cour.where("matiere=?", params[:matiere])
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
    if !latitude
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
          
          if !cour.jour
            dispo = params[:dispo].split(",")
            dispo[1] = dispo[1].to_i
            Dispo.create cour_id:cour.id, jour:dispo[0], heure:dispo[1]
            cour.update(jour:dispo[0])
            cour.update(heure:dispo[1])
          end

          #On calcule la date reguliere
          wday = {"lundi"=>1, "mardi"=>2, "mercredi"=>3, "jeudi"=>4, "vendredi"=>5,
          "samedi"=>6, "dimanche"=>0}
          delta_jours = (wday[cour.jour] - Date.today.wday)
          if delta_jours < 0 
            delta_jours += 7
          end
          date_reg = Date.today + delta_jours
          #Conversion implicite de la date au format 2018-05-04: strftime("%Y-%m-%d")
          cour.update(date_reg:date_reg)
          #On cree la lesson et la presence associee
          #Lesson.create cour_id:cour.id, date:date_reg
          Lesson.find_by_cour_id(cour.id).update(date:date_reg)
        end
      cour.save
      
      Inscription.create user_id:current_user.id, cour_id:cour.id
      #Presence.create lesson_id:cour.lessons.last.id, user_id:current_user.id, perf:true

      UserMailer.inscription(current_user, cour).deliver
      TeacherMailer.inscription(cour.teacher,cour,current_user).deliver
      redirect_to '/pages/monespace'
    else
      redirect_to controller: 'cours', action: 'show', id: params[:id]
      flash[:info] = "Ce cours est complet."
    end
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
      if cour.lessons.last.present?
        cour.lessons.last.update(date:date_reg)
      end
    end
    #UserMailer.modifier(Cour.find(params[:id])).deliver

    #TeacherMailer.inscription(Cour.find(params[:id]).teacher).deliver
    redirect_to controller: 'cours', action:'modifier', id:params[:id]
  end

  private

  def teacher_complet(teacher)

    teacher.infoteacher.first_name.present? and teacher.infoteacher.last_name.present? and teacher.infoteacher.dptm.present? and
    teacher.infoteacher.email.present? and teacher.infoteacher.cgu and teacher.infoteacher.stripe_id.present? and
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
