class ContactusMailer < ApplicationMailer

	def contact(nom,email,sujet,message)
		@nom = nom
		@email = email
		@sujet = sujet
		@message = message
		mail to:"sajid123@hotmail.fr", subject:@sujet
		
	end
end
