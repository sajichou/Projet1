class PagesController < ApplicationController

  def monespace
    #On affiche la liste des cours proposés si teacher et la liste des cours suivis si user
    if user_signed_in?
      @inscriptions = Inscription.where("user_id = ?", current_user.id)       
    elsif teacher_signed_in?
      @cours_proposes = Cour.where("teacher_id=?", current_teacher.id)
    end     
  end

  def medesabonner
    inscription = Inscription.find(params[:id])
    cour = inscription.cour 
    cour.nombre_eleves = cour.nombre_eleves - 1
    cour.save
    inscription.destroy
    #On supprime aussi sa presence
    if (cour.lessons.last.present? and cour.lessons.last.presences.present?)
      puts "desabonnement"
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

  def completer
    if teacher_signed_in?
      puts"latitude"
      puts params[:latitude]
      puts "long"
      puts params[:longitude]
      Infoteacher.find_by_teacher_id(current_teacher.id).update(
        first_name:params[:first_name],
        last_name:params[:last_name],
        email:params[:email],
        phone: params[:phone],
        location: params[:location],
        methodology: params[:methodology],
        experience: params[:experience],
        latitude: params[:latitude],
        longitude: params[:longitude]
        )
      
      if(session[:page_id].present?)
        redirect_to controller:"cours", action: "show", id: session[:page_id]
      else
        redirect_to '/pages/maphoto'
      end
    elsif user_signed_in?
      Infouser.find_by_user_id(current_user.id).update(
        first_name:params[:first_name],
        last_name:params[:last_name],
        email:params[:email],
        phone: params[:phone],
        location: params[:location],
        niveau: params[:niveau]
        )
      if(session[:page_id].present?)
        redirect_to controller:"cours", action: "show", id: session[:page_id]
      else
        redirect_to '/pages/monespace' 
      end
    end
  end


  def monprofil
    if teacher_signed_in?
      @current_teacher = current_teacher
    elsif user_signed_in?
      @current_user = current_user
    end
  end

  def maphoto
    if teacher_signed_in?
      @current_teacher = current_teacher
    elsif user_signed_in?
      @current_user = current_user
    end
  end

  def code_promo
    if params[:id].present?
      @cour_id = params[:id]
    end
    if params[:dispo].present?
      @dispo = params[:dispo]
    end
  end

  def paiement
  end

  def code_promo_create
    current_user.infouser.update(code:params[:code])
    if params[:id].present?
      #redirect_to '/charges/new'
      redirect_to controller: 'charges', action: 'new', id: params[:id], dispo: params[:dispo]
    else
      redirect_to '/pages/code_promo'
    end
      
  end

  def modifier_maphoto
    if teacher_signed_in?
      current_teacher.infoteacher.update(avatar:params[:avatar])
      redirect_to '/pages/paiement'
    elsif user_signed_in?
      current_user.infouser.update(avatar:params[:avatar])    
      redirect_to  '/pages/maphoto'
    end 
  end     

  def contactus
    @nom = params[:nom]
    @email = params[:email]
    @sujet = params[:sujet]
    @message = params[:message]
    ContactusMailer.contact(@nom,@email,@sujet,@message).deliver
    redirect_to root_path
  end

end
