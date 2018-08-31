class TeacherMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.teacher_mailer.validated.subject
  #
  def validated(teacher)
    @teacher = teacher
    mail( :to => @teacher.email,
    :subject => 'Votre compte professeur est maintenant validé' )
  end


  def validation(teacher)
    @teacher = teacher
    mail( :to => @teacher.email,
    :subject => 'Votre profil est maintenant validé!' )
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.teacher_mailer.inscription.subject
  #

  def demande_inscription(cour,user, jour, heure)
    @teacher = cour.teacher
    @user = user
    @cour = cour
    @jour = jour
    @heure = heure
    mail( :to => @teacher.email,
    :subject => "Un élève souhaite s'inscrire à votre cours!")
  end

  def inscription(teacher,cour,eleve)
    @teacher = teacher
    @cour = cour
    @eleve= eleve
    mail( :to => @teacher.email,
    :subject => 'Un nouvel élève a rejoint votre cours!' )
  end

  def rappel_avant_cours(teacher, cour)
    @teacher = teacher
    @cour = cour
    subject = "Rappel pour votre cours de " + @cour.matiere + " demain à " + @cour.heure.to_s + "h."
    mail( :to =>@teacher.email, :subject =>subject)
  end

  def rappel_apres_cours(teacher, cour)
    @teacher = teacher
    @cour = cour
    subject = "Rappel: Bilan du cours de " + @cour.jour
    mail( :to =>@teacher.infoteacher.email, :subject => subject)
  end

  def contact(teacher, user)
    @teacher = teacher
    @user = user
    subject = "Nouveau message"
    mail( :to =>@teacher.infoteacher.email, :subject => subject)
  end

  def absence(user, lesson)
    @user = user
    @lesson = lesson
    @teacher = lesson.cour.teacher
    subject = "Absence de " + @user.infouser.first_name +@user.infouser.last_name
    mail( :to =>@teacher.infoteacher.email, :subject => subject)
  end

end
