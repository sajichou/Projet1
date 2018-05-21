class ChargesController < ApplicationController

  before_action :authenticate_user! ,only: [:new]
  before_action :premier_eleve ,only: [:new]

	def new
		@cours_id = params[:id]
		puts @cours_id
		if params[:dispo].present?
			@dispo = params[:dispo]
		end
	end

	def create
	  # Amount in cents
	  @amount = 130
	  @stripe_teacher_id = Cour.find(params[:cours_id]).teacher.infoteacher.stripe_id
	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  current_user.infouser.update(stripe_customer_id:customer.id)

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe Connect',
	    :currency    => 'eur',
	    :destination => {
	    	:amount => 100,
    		:account => @stripe_teacher_id,
 		 }
	  )
	  redirect_to controller: 'cours', action: 'inscription', id: params[:cours_id], dispo: params[:dispo]

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
		puts hash_response["stripe_user_id"]
		current_teacher.infoteacher.update(stripe_id:hash_response["stripe_user_id"])
		#redirect_to "/pages/monespace"
	end

end
