class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup.subject
  #
  def signup(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Merci pour votre inscription!' )
  end

  def inscription(user, cour)
  	@user = user
  	@cour = cour
  	#subject = "Votre inscription au cours de" + @cours.teacher.infoteacher.email
  	mail( :to => @user.email,
    :subject => 'Votre inscription au cours de #{@cours.teacher.infoteacher.email}!' )
  end
  

end
