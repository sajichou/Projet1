# Preview all emails at http://localhost:3000/rails/mailers/teacher_mailer
class TeacherMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/teacher_mailer/validated
  def validated
    TeacherMailer.validated
  end

  # Preview this email at http://localhost:3000/rails/mailers/teacher_mailer/inscription
  def inscription
    TeacherMailer.inscription
  end

end
