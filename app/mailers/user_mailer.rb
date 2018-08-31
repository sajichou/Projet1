class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup.subject
  #
  def signup(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Bienvenue dans la communauté de La Kamaraderie ' )
  end

  def inscription(user, cour)
  	@user = user
  	@cour = cour
  	subject = "Votre inscription au cours de " + @cour.teacher.infoteacher.email
  	mail( :to => @user.email,
    :subject => subject)
  end
  
  def rappel_avant_cours(user, cour)
    @user = user
    @cour = cour
    subject = "Rappel pour votre cours de " + @cour.matiere + " demain à " + @cour.heure.to_s + "h."
    mail( :to =>@user.email, :subject =>subject)
  end


  def rappel_apres_cours(user, cour)
    @user = user
    @cour = cour
    subject = "Bilan de votre cours de " + @cour.matiere
    mail( :to =>@user.email, :subject => subject)
  end

  def modifier_ex(cour,user)
    @cour = cour
    subject = "Modification de la date du prochain cours avec " + @cour.teacher.infoteacher.first_name
    @user = user
    mail( :to=>@user.email, :subject => "subject")
  end

  def contact(teacher,user)
    @teacher = teacher
    @user = user
    subject = "Nouveau message"
    mail( :to =>@user.infouser.email, :subject => subject)
  end

  def commentaire(user, cour, contenu, date)
    @user = user
    @cour = cour
    @date = date
    @contenu = contenu
    subject = "Bilan de votre cours de " + @cour.matiere
    mail( :to =>@user.email, :subject => subject)
  end

  def absence(user, lesson)
    @user = user
    @lesson = lesson
    subject = "Absence confirmée"
    mail( :to =>@user.infouser.email, :subject => subject)
  end

end
