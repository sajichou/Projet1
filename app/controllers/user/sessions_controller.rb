# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :nice_destroy ,only: [:destroy]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    #super(resource)

    #'/pages/monprofil'
    #puts"after sign in avant if"
    if(session[:page_id].present?)
        cours_show_path(session[:page_id])
    else
      '/cours/accueil'  
    end

  end

end
  
private

  def nice_destroy
    today = Time.zone.today
    hour = Time.zone.now.hour
    Inscription.where(user_id:current_user.id).each do |inscription|
      cour = inscription.cour 
      cour.nombre_eleves = cour.nombre_eleves - 1
      cour.save
      inscription.destroy
      #On supprime aussi sa presence non payée si delai respecté
      lesson = Cour.find(params[:id]).lessons.last
      if cour.horaire_ex.present?
        heure = cour.horaire_ex.to_i
      else
        heure = cour.heure.to_i
      end
      presence = Presence.where(lesson_id:lesson.id, user_id:current_user.id).last

      if (lesson.date.to_date - today > 0 and heure - hour >= 0 )
        presence.destroy
      end
    end

  end

end