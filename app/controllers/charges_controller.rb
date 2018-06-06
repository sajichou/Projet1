class ChargesController < ApplicationController

  before_action :authenticate_user! ,only: [:new]
  before_action :premier_eleve ,only: [:new]

	def new
		@cours_id = params[:id]
		if params[:dispo].present?
			@dispo = params[:dispo]
		end
	end

	def create

	  	# Amount in cents
	  	amount = ENV["AMOUNT"].to_i
	  	@stripe_teacher_id = Cour.find(params[:cours_id]).teacher.infoteacher.stripe_id
	  	customer = Stripe::Customer.create(
	    	:email => params[:stripeEmail],
	    	:source  => params[:stripeToken]
	  	)

	  	#current_user.infouser.update(stripe_customer_id:customer.id)
	  	#On enregistre le customer id associe a ce cours
	  	Stripe_customer.create user_id:current_user.id, cour_id:params[:cours_id],
	   		stripe_customer_id:customer.id

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
			Presence.create lesson_id:Cour.find(params[:cours_id]).lessons.last.id, user_id:current_user.id, 
	  			perf:true
	  	end

	  redirect_to controller: 'cours', action: 'inscription', id: params[:cours_id], dispo: params[:dispo]

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path

	end

	def connect
		
		require 'net/http'
		require 'uri'
		require 'json'

		puts "ICICICI"
		uri = URI.parse("https://connect.stripe.com/oauth/token")
		request = Net::HTTP::Post.new(uri)
		request.set_form_data(
			#A changer selon test ou prod mode !!!!!!!!!!!!!
		  "client_secret" =>ENV["STRIPE_SECRET_KEY"],
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
		redirect_to "/pages/monespace"
		flash[:info] = "Nous allons maintenant vérifier vos informations. Nous vous enverrons un mail sous 24h."
	end

end
