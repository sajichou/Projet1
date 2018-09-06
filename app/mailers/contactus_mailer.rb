class ContactusMailer < ApplicationMailer
	
	def contact(email,sujet,message)

		if !email.present?
			@email= "Sans email"
		else
			@email = email
		end
		@sujet = sujet
		@message = message
		puts "ici"
		mail to:"contact@topnote.fr", subject:@sujet, from:"sajid123@hotmail.fr"
	end

end
