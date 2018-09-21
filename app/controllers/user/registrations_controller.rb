# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
    before_action :nice_destroy ,only: [:destroy]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
   def after_sign_up_path_for(resource)
    #super(resource)

    #'/pages/monprofil'

    if(session[:page_id].present?)
        cours_show_path(session[:page_id])
    else
      '/users/sign_up'  
    end
   end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end


  def nice_destroy
    today = Time.zone.today
    hour = Time.zone.now.hour
    Inscription.where(user_id:current_user.id).each do |inscription|
      cour = inscription.cour 
      cour.nombre_eleves = cour.nombre_eleves - 1
      cour.save
      #On supprime aussi sa presence non payée si delai respecté
      lesson = Cour.find(inscription.cour_id).lessons.last
      if cour.horaire_ex.present?
        heure = cour.horaire_ex.to_i
      else
        heure = cour.heure.to_i
      end
      presence = Presence.where(lesson_id:lesson.id, user_id:current_user.id, perf:false).last
      if (lesson.date.to_date - today > 0 and heure - hour >= 0 )
        presence.destroy
      elsif lesson.date.to_date - today > 1
        presence.destroy
      end
      inscription.destroy
    end

  end


end
