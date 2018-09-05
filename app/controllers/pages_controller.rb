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
    if params[:cgu].present?
      cgu = true
    end
    puts params[:dptm]
    if teacher_signed_in?
      Infoteacher.find_by_teacher_id(current_teacher.id).update(
        first_name:params[:first_name],
        last_name:params[:last_name],
        email:params[:email],
        phone: params[:phone],
        dptm: params[:dptm],
        methodology: params[:methodology],
        experience: params[:experience],
        cgu: cgu,
        justificatif_identite: params[:justificatif_identite],
        justificatif_diplome: params[:justificatif_diplome]
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
        niveau: params[:niveau],
        cgu: cgu
        )
      if(session[:page_id].present?)
        redirect_to controller:"cours", action: "show", id: session[:page_id]
          if user_complet(current_user)
            flash[:info] = "Votre profil est complet, vous pouvez maintenant vous inscrire à un cours !"
          else
            flash[:info] = "Votre profil n'est pas encore complet."
          end 
      else
        redirect_to root_path
        if user_complet(current_user)
          flash[:info] = "Votre profil est complet, vous pouvez maintenant vous inscrire à un cours ! !" 
        else
          flash[:info] = "Votre profil n'est pas encore complet."
        end
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

  def messages
    if teacher_signed_in?
      messages = Contactmessage.where(teacher_id:current_teacher.id)
      puts messages
      @messages_tries = []
      messages.each do |m|
        a = true
        @messages_tries.each do |t|
          if (m.user_id == t.user_id and m.cour_id == t.cour_id)
            a = false
          end
        end
        if a 
          @messages_tries << m
        end
      end
    elsif user_signed_in?
      messages = Contactmessage.where(user_id:current_user.id)
      @messages_tries = []
      messages.each do |m|
        a = true
        @messages_tries.each do |t|
          if (m.teacher_id == t.teacher_id and m.cour_id == t.cour_id)  
            a = false
          end
        end
        if a 
          @messages_tries << m
        end
      end
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
    if user_signed_in?
      @paiements = Paiement.where(user_id:current_user.id)
    elsif teacher_signed_in?
      @paiements = Paiement.where(teacher_id:current_teacher.id)
    end
  end

  def dashboard
    if user_signed_in?
        @notifications = Notification.where(recipient: current_user).unread
        @nb_nouveaux_messages = @notifications.length
    elsif teacher_signed_in?
        @notifications = Notification.where(recipient: current_teacher).unread
        @nb_nouveaux_messages = @notifications.length
        #Les demandes d'inscription envoyées par les eleves
        @demandes = Demande.where("state IS NULL",teacher_id=current_teacher.id)
    end
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
      if params[:avatar].present?
        current_teacher.infoteacher.update(avatar:params[:avatar])
      end
      flash[:info] = "Votre photo a bien été enregistrée."
      redirect_to '/pages/paiement'
    elsif user_signed_in?
      if params[:avatar].present?
        current_user.infouser.update(avatar:params[:avatar])
      end    
      redirect_to '/pages/maphoto'
    end 
  end     

  def contactus
    @email = params[:email]
    @sujet = params[:sujet]
    @message = params[:message]
    puts "contactus controller"
    ContactusMailer.contact(@email,@sujet,@message).deliver
    redirect_to root_path
  end

end

private

def user_complet(user)

  user.infouser.first_name.present? and user.infouser.last_name.present? and user.infouser.niveau.present? and
  user.infouser.email.present? and user.infouser.cgu
  
end
