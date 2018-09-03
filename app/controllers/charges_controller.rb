class ChargesController < ApplicationController

  before_action :authenticate_user! ,only: [:new]
  before_action :premier_eleve ,only: [:new]

	def new
		@cours_id = params[:id]
		@dispo = params[:dispo]
	end

	def create

		#On enregistre les info bancaires de l eleve 
	  	customer = Stripe::Customer.create(
	    	:email => params[:stripeEmail],
	    	:source  => params[:stripeToken]
	  	)
	  	StripeCustomer.create user_id:current_user.id, cour_id:params[:cours_id],
	   		stripe_customer_id:customer.id
	   	nb = Cour.find(params[:cours_id]).nombre_eleves
	   	if nb < 1
		   	#On envoie une demande au professeur par mail 
		   	dispo = params[:dispo].split(",") #"lundi,14,30"
		   	puts "dispo"
		   	puts dispo
		   	if dispo == nil
		   		jour = Cour.find(params[:cours_id]).jour
		   		heure = Cour.find(params[:cours_id]).heure
		   		min = Cour.find(params[:cours_id]).min
		   	else
			   	jour = dispo[0]
			   	heure = dispo[1].to_i
			   	min = dispo[2].to_i
			end
		   	TeacherMailer.demande_inscription(Cour.find(params[:cours_id]),current_user,jour,heure).deliver
		   	#On envoie une demande par SMS
		   	@twilio_number = ENV['TWILIO_NUMBER']
		    account_sid = ENV['TWILIO_ACCOUNT_SID']
		    @client = Twilio::REST::Client.new(account_sid, ENV['TWILIO_AUTH_TOKEN'])
		    teacher_phone = "+33" + Cour.find(params[:cours_id]).teacher.infoteacher.phone
		    twilio_phone_number = "TopNote"
		    #time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
		    #reminder = "Hi #{self.name}. Just a reminder that you have an appointment coming up at #{time_str}."
		    reminder = "Hello, un élève souhaite s'inscrire à l'un de vos cours! Rendez-vous sur votre espace pour l'accepter. Sans réponse de votre part sous 24h, sa demande sera refusée. "
		    message = @client.api.account.messages.create(
		      #:from => '+33644640536',
		      :from =>twilio_phone_number,
		      #:to => self.phone_number,
		      :to => teacher_phone,
		      :body => reminder,
		    )
		   	#On sauvegarde la date d'envoie et le choix de créneau de l'eleve
		   	Demande.create(user_id:current_user.id, cour_id:params[:cours_id], teacher_id: Cour.find(params[:cours_id]).teacher.id,
		   		created_at:Time.zone.now, jour:jour, heure:heure)
=begin
	  	# Amount in cents
	  	amount = ENV["AMOUNT"].to_i
	  	@stripe_teacher_id = Cour.find(params[:cours_id]).teacher.infoteacher.stripe_id
	   	puts "AAAA"
	   	puts params[:dispo]
		puts "ID"
		puts params[:cours_id] 

	  	#Si pas de code promo il paye  
	  	if (current_user.infouser.code != "LANCEMENT18" or current_user.infouser.code_used)
		  	description = "Cour de " + Cour.find(params[:cours_id]).teacher.email
		  	transfer_group = "Lesson " + Cour.find(params[:cours_id]).lessons.last.id.to_s
		  	charge = Stripe::Charge.create({
		    	:customer    => customer.id,
		    	:amount      => amount,
		    	:description => description,
		    	:currency    => 'eur',
		    	:metadata => {'first_name' => current_user.infouser.first_name},
	 			:transfer_group => transfer_group, 
	 			#:on_behalf_of => Cour.find(params[:cours_id]).teacher.email
		  	})
		  	Presence.create lesson_id:Cour.find(params[:cours_id]).lessons.last.id, user_id:current_user.id, 
	  		perf:true, charge_id:charge.id
	  	#Si code promo il paye pas
		else
			current_user.infouser.update(code_used:true)
			puts "BBBBB"
			puts "Dispo"
			puts params[:dispo]
			puts "ID"
			puts params[:cours_id]
			Presence.create lesson_id:Cour.find(params[:cours_id]).lessons.last.id, user_id:current_user.id, 
	  			perf:true
	  	end

		Presence.create lesson_id:Cour.find(params[:cours_id]).lessons.last.id, user_id:current_user.id, 
	  		perf:false, charge_id:charge.id

	  	redirect_to controller: 'cours', action: 'inscription', id: params[:cours_id], dispo: params[:dispo]
=end
		elsif (nb > 0 and nb < 3)
			Presence.create(lesson_id:Cour.find(params[:cours_id]).lessons.last.id, user_id:current_user.id, 
	  		perf:false)
	  		nb += 1
	  		Cour.find(params[:cours_id]).update(nombre_eleves: nb)
	  		Inscription.create user_id:current_user.id, cour_id:params[:cours_id]
      		UserMailer.inscription(current_user, Cour.find(params[:cours_id])).deliver
      		TeacherMailer.inscription(Cour.find(params[:cours_id]).teacher,Cour.find(params[:cours_id]),current_user).deliver


		end
		redirect_to controller: 'pages', action: 'dashboard'

		rescue Stripe::CardError => e
	  		flash[:error] = e.message
	  		redirect_to new_charge_path

	end

	def connect
		
		require 'net/http'
		require 'uri'
		require 'json'

		uri = URI.parse("https://connect.stripe.com/oauth/token")
		request = Net::HTTP::Post.new(uri)
		request.set_form_data(
			#A changer selon test ou prod mode !!!!!!!!!!!!!
		  "client_secret" =>ENV["STRIPE_TEST_SECRET_KEY"],
		  "code" => params[:code],
		  "grant_type" => "authorization_code",
		)
		req_options = {
		  use_ssl: uri.scheme == "https",
		}
		response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
		  http.request(request)
		end
		#render :json => response.body
		hash_response = JSON.parse(response.body)
		current_teacher.infoteacher.update(stripe_id:hash_response["stripe_user_id"])
		redirect_to "/cours/accueil"
		flash[:info] = "Nous allons maintenant vérifier vos informations. Nous vous enverrons un mail sous 24h :)"
	end

end
