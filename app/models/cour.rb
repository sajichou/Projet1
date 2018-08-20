class Cour < ActiveRecord::Base
	acts_as_paranoid
	
	has_many :users
	has_many :annees, dependent: :destroy
	has_many :dispos, dependent: :destroy
	belongs_to :teacher
	has_many :inscriptions, dependent: :destroy
	has_many :lessons
	has_many :contactmessages

	after_validation :affichage_lieu, on: [ :create, :update ]

	after_create :reminder

	def reminder
		@twilio_number = ENV['TWILIO_NUMBER']
	    account_sid = ENV['TWILIO_ACCOUNT_SID']
	    @client = Twilio::REST::Client.new(account_sid, ENV['TWILIO_AUTH_TOKEN'])
	    #time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
	    #reminder = "Hi #{self.name}. Just a reminder that you have an appointment coming up at #{time_str}."
	    reminder = "Hi! A quick reminder."
	    message = @client.api.account.messages.create(
	      :from => '+33644640536',
	      #:to => self.phone_number,
	      :to => '+33667306874',
	      :body => reminder
	    )
	end

	private

	def affichage_lieu
		self.lieu_court = self.route + ", " + self.postal_code + ", " + self.locality
	end
end
