class CoursController < ApplicationController

  before_action :authenticate_user! ,only: [:inscription]
  before_action :authenticate_teacher! ,only: [:new, :create, :destroy]
  before_action :teacher_validated, only: [:new, :destroy]

  def index
     @cours = Cour.page(params[:page]).per(20)
  end

  def create
  end

  def new
    cour = Cour.create teacher_id:current_teacher.id, matiere:params[:matiere], jour:params[:jour], 
    lieu:params[:lieu]
    #cours.latitude =  Geocoder.coordinates(params[:lieu])[0]
    #cours.longitude = Geocoder.coordinates(params[:lieu])[1]
    cour.save
    #sleep (3)
    redirect_to "/cours/index"
  end

  def show
    @cour = Cour.find(params[:id])
    @inscriptions = Inscription.where("cour_id=?",@cour.id)
  end

  def update
  end

  def destroy
    cour = Cour.find(params[:id]).destroy
    inscriptions = Inscription.where(cour_id: params[:id])
    inscriptions.each do |i|
      i.destroy
    end
    redirect_to '/cours/index'
  end

  def accueil
    @client_location = request.location.address
  end

  def search
    @cours = Cour.where("matiere=? AND nombre_eleves < ?", params[:matiere], 3)
    @lieu = params[:lieu]
    #@lieu_coo = Geocoder.coordinates(params[:lieu])

  end

  def inscription
    cour = Cour.find(params[:id])
    cour.nombre_eleves = cour.nombre_eleves + 1
    cour.save
    #cours.inscriptions.create user_id:current_user.id
    inscription = Inscription.create user_id:current_user.id, cour_id:cour.id
    inscription.save

    redirect_to '/cours/index'
  end

  private

  def teacher_validated
    #unless (teacher_signed_in? and Role.where(teacher_id: current_teacher.id).last.power==1)
      #redirect_to '/teachers/sign_in'
   # end

    if (!teacher_signed_in?)
      redirect_to '/teachers/sign_in'
    elsif (teacher_signed_in? and Role.where(teacher_id: current_teacher.id).last.power==0)
      flash[:info] = "Vous devez d'abord terminer votre inscription"
      redirect_to '/pages/monprofil/'
    end

  end

end
