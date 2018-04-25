class TeacherMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.teacher_mailer.validated.subject
  #
  def validated(teacher)
    @teacher = teacher
    mail( :to => @teacher.email,
    :subject => 'Votre profil est maintenant validé!' )
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.teacher_mailer.inscription.subject
  #
  def inscription(teacher)
    @teacher = teacher
    mail( :to => @teacher.email,
    :subject => 'Un nouvel élève a rejoint votre cours!' )
  end
end
