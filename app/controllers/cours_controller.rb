class CoursController < ApplicationController

  before_action :authenticate_user! ,only: [:inscription]
  before_action :premier_eleve ,only: [:inscription]
  before_action :authenticate_teacher! ,only: [:new, :create, :destroy]
  before_action :teacher_validated, only: [:new, :destroy]

  def index
     @cours = Cour.page(params[:page]).per(20)
  end

  def create
  end

  def new
    cour = Cour.create teacher_id:current_teacher.id, matiere:params[:matiere], lieu:params[:lieu]
    params[:classe].each do |c|
      Annee.create cour_id:cour.id, teacher_id:current_teacher.id, niveau:c
    end
    params[:dispo].each do |c|
      c = c.split(",")
      c[1] = c[1].to_i
      Dispo.create cour_id:cour.id, jour:c[0], heure:c[1]
    end
    if cour.dispos.length == 1
      cour.update(jour:cour.dispos.first.jour)
      cour.update(heure:cour.dispos.first.heure)
    end
    #cours.latitude =  Geocoder.coordinates(params[:lieu])[0]
    #cours.longitude = Geocoder.coordinates(params[:lieu])[1]
    #sleep (3)
    redirect_to "/pages/monespace"
  end

  def show
    @cour = Cour.find(params[:id])
    @inscriptions = Inscription.where("cour_id=?",@cour.id)

    # Si aucun eleve encore inscrit :

    def MinJour (j1,j2)
      hash_jours = {"lundi":1, "mardi":2, "mercredi":3, "jeudi":4, "vendredi":5, "samedi":6, "dimanche":7} 
      #puts hash_jours[j1.to_sym]
      if(hash_jours[j1.to_sym] <= hash_jours[j2.to_sym])
        return true
      else
        return false
      end
    end

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

  def update
  end

  def destroy
    cour = Cour.find(params[:id]).destroy
    inscriptions = Inscription.where(cour_id: params[:id])
    inscriptions.each do |i|
      i.destroy
    end
    redirect_to '/pages/monespace'
  end

  def accueil
    @client_location = request.location.address
    
  end

  def search

    niveau = params[:classe].to_i
    @cours = Cour.where("matiere=? AND nombre_eleves < ?  ", params[:matiere], 3)
    liste = []
    @cours.each do |cg|
      cg.annees.each do |cp|
        if(cp.niveau == niveau || cp.niveau == 13)
          liste.push(cg)
        end
      end
    end
    @cours = liste
    @lieu = params[:lieu]
    @dist_hash = {}
    @dist = {}
    @cours.each do |c|
      a = Geocoder::Calculations.distance_between([c.latitude, c.longitude], @lieu, :units =>:km).round(2)
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
        dispo = params[:dispo].split(",")
        dispo[1] = dispo[1].to_i
        Dispo.create cour_id:cour.id, jour:dispo[0], heure:dispo[1]
        cour.update(jour:dispo[0])
        cour.update(heure:dispo[1])
      end
    cour.save
  
    inscription = Inscription.create user_id:current_user.id, cour_id:cour.id
    inscription.save

    UserMailer.inscription(current_user, cour).deliver
    TeacherMailer.inscription(cour.teacher).deliver
    redirect_to '/pages/monespace'
  end

  private

  def teacher_validated
    #unless (teacher_signed_in? and Role.where(teacher_id: current_teacher.id).last.power==1)
      #redirect_to '/teachers/sign_in'
   # end

    if (!teacher_signed_in?)
      redirect_to '/teachers/sign_in'
    elsif (teacher_signed_in? and Role.where(teacher_id: current_teacher.id).last.power==0)
      flash[:info] = "Vous devez d'abord terminer votre inscription. Vous recevrez ensuite un mail de validation"
      redirect_to '/pages/monprofil/'
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

end
