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
      TeacherMailer.contact(message.teacher,message.user).deliver
      #On envoie une demande par SMS
        @twilio_number = ENV['TWILIO_NUMBER']
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        @client = Twilio::REST::Client.new(account_sid, ENV['TWILIO_AUTH_TOKEN'])
        teacher_phone = "+33" + message.teacher.infoteacher.phone
        twilio_phone_number = "TopNote"
        #time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
        #reminder = "Hi #{self.name}. Just a reminder that you have an appointment coming up at #{time_str}."
        reminder = "Hello, "+ message.teacher.infoteacher.first_name + " vous a envoyé un message. 
        Rendez-vous sur votre espace personnel pour le lire."
        message = @client.api.account.messages.create(
          #:from => '+33644640536',
          :from =>twilio_phone_number,
          #:to => self.phone_number,
          :to => teacher_phone,
          :body => reminder,
        )
    else
      Notification.create actor:message.teacher, recipient:message.user, action:"envoyé", notifiable:message
      UserMailer.contact(message.teacher,message.user).deliver
      #On envoie une demande par SMS
        @twilio_number = ENV['TWILIO_NUMBER']
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        @client = Twilio::REST::Client.new(account_sid, ENV['TWILIO_AUTH_TOKEN'])
        user_phone = "+33" + message.user.infouser.phone
        twilio_phone_number = "TopNote"
        #time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
        #reminder = "Hi #{self.name}. Just a reminder that you have an appointment coming up at #{time_str}."
        reminder = "Hello"+ message.teacher.infoteacher.first_name + " a répondu à votre message. 
        Rendez-vous sur votre espace personnel pour le lire."
        message = @client.api.account.messages.create(
          #:from => '+33644640536',
          :from =>twilio_phone_number,
          #:to => self.phone_number,
          :to => user_phone,
          :body => reminder,
        )
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
