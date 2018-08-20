class MessagesController < ApplicationController
  def index
  end

  def show
    message = Contactmessage.find(params[:message_id])
    @messages = Contactmessage.where(user_id:message.user_id, 
      teacher_id:message.teacher_id, cour_id:message.cour_id)
  end

  def create
  end

  def new
    bool = user_signed_in?
    message = Contactmessage.find(params[:message_id])
    Contactmessage.create cour_id:message.cour_id, user_id:message.user_id, message:params[:message], teacher_id:message.teacher_id, ecritparuser:bool  
    #Envoyer un mail et une notif  
    if bool 
      Notification.create recipient:message.teacher, 
      actor:message.user, 
      action:"envoyé", 
      notifiable:message
      #TeacherMailer.contact(message.teacher,message.user).deliver
    else
      Notification.create actor:message.teacher, recipient:message.user, action:"envoyé", notifiable:message
      #UserMailer.contact(message.teacher,message.user).deliver
    end
    redirect_to controller: 'messages', action:'show', message_id:params[:message_id]

  end


  def destroy
  end

  def mark_as_read_and_read
    #recoit un message_id
    Notification.where(notifiable_id:params[:message_id]).update(read_at:Time.zone.now)
    redirect_to controller: 'messages', action:'show', message_id:params[:message_id]

  end 


end
