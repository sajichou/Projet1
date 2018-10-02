class ChargesController < ApplicationController

  before_action :authenticate_user! ,only: [:new]
  before_action :premier_eleve ,only: [:new]

	def new
		@cours_id = params[:id]
		@dispo = params[:dispo]
		@objectif = params[:objectif]
		@topics = params[:topics]
		#On check le code promo
		@codes = ["LANCEMENT18", "TOPDEPART18", "PASPARFAIT18", "TOPLBC18"]
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

	def custom_connect

		#Stripe.api_key = "sk_test_4eC39HqLyjWDarjtT1zdp7dc"

		#@acct = Stripe::Account.create({
    	#:country => "FR",
    	#:type => "custom"
		#})

		

	end

	def create_account
<<<<<<< HEAD
		if (params[:token].present? and current_teacher.infoteacher.stripe_id==nil)
			Stripe.api_key = ENV["STRIPE_TEST_SECRET_KEY"]
			token = params[:token]
			acct = Stripe::Account.create({
			    :country => "FR",
			    :type => "custom",
			    :account_token => token,

			})
			current_teacher.infoteacher.update(stripe_id:acct.id)
		elsif (params[:token].present? and current_teacher.infoteacher.stripe_id.present?)
			acct = Stripe::Account.retrieve(current_teacher.infoteacher.stripe_id)
			acct.account_token = params[:token]
			acct.save
		end
=======
		Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
		token = params[:token]
		acct = Stripe::Account.create({
		    :country => "FR",
		    :type => "custom",
		    :account_token => token,
		})
		current_teacher.infoteacher.update(stripe_id:acct.id)
>>>>>>> 3892a44e8a80c577d8c37ba61cfdfed3287e343f
	end


end
