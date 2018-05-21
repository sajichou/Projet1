class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 # require 'user_sanitizer'
  #require 'teacher_sanitizer'
  
 # protected

  #def devise_parameter_sanitizer
   # if resource_class == User
   #   User::ParameterSanitizer.new(User, :user, params)
   # elsif resource_class == Teacher
   #   Teacher::ParameterSanitizer.new(Teacher, :teacher, params)
   # else
    #  super # Use the default one
   # end
  #end

  private
  
  def premier_eleve
    cour = Cour.find(params[:id])
    #On peut verifier que l eleve a bien renseigné sa classe mais on pourrait aussi bien tout vérifier
    if (cour.nombre_eleves < 1 and !current_user.infouser.niveau.present?)
      flash[:info] = "Vous devez d'abord terminer votre inscription"
      redirect_to '/pages/monprofil/'
    end
  end
  
end

