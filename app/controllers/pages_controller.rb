class PagesController < ApplicationController

  def monespace
    #On affiche la liste des cours proposés si teacher et la liste des cours suivis si user
    if user_signed_in?
      @inscriptions = Inscription.where("user_id = ?", current_user.id)       
    elsif teacher_signed_in?
      @cours_proposes = Cour.where("teacher_id=?", current_teacher.id)
    end     
  end

  def completer
    
    Infoteacher.find_by_teacher_id(current_teacher.id).update(
      first_name:params[:first_name],
      last_name:params[:last_name],
      email:params[:email],
      phone: params[:phone],
      location: params[:location],
      methodology: params[:methodology],
      experience: params[:experience],
      avatar: params[:avatar]
      )
    redirect_to '/pages/monespace'
  end


  def monprofil
    if teacher_signed_in?
      @current_teacher = current_teacher
    elsif user_signed_in?
      @current_user = current_user
    end
  end

    

end
