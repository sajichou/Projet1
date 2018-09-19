class ChargesController < ApplicationController

  before_action :authenticate_user! ,only: [:new]
  before_action :premier_eleve ,only: [:new]

	def new
		@cours_id = params[:id]
		@dispo = params[:dispo]
		@objectif = params[:objectif]
		@topics = params[:topics]
	end

	def create

		#On enregistre les info bancaires de l eleve 
	  	customer = Stripe::Customer.create(
	    	:email => params[:stripeEmail],
	    	:source  => params[:stripeToken]
	  	)
	  	StripeCustomer.create user_id:current_user.id, cour_id:params[:cours_id],
	   		stripe_customer_id:customer.id

		redirect_to controller: 'cours', action: 'inscription', id:params[:cours_id], dispo:params[:dispo], objectif:params[:objectif], topics:params[:topics]

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
		redirect_to "/cours/accueil"
		flash[:info] = "Nous allons maintenant vérifier vos informations. Nous vous enverrons un mail sous 24h :)"
	end

end
