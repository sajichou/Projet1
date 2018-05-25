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
    :subject => 'Votre inscription au cours de #{@cour.teacher.infoteacher.email}!' )
  end
  
  def rappel_avant_cours(user, cour)
    @user = user
    @cour = cour
    mail( :to =>@user.email, :subject => 'Rappel pour votre cours de demain')
  end


  def rappel_apres_cours(user, cour)
    @user = user
    @cour = cour
    mail( :to =>@user.email, :subject => 'Bilan de votre cours')
  end

  def modifier(cour)
    @cour = cour
    cour.inscriptions.each do |i|
      user = User.find(i.user_id)
     # mail( :to=>user.email, :subject => "Nouvel horaire pour votre cours")
      mail( :to=>"karimsalhi@netaxis.com", :subject => "Test sans lien")
    end
  end

end
