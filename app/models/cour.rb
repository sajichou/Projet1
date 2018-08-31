class Cour < ActiveRecord::Base
	acts_as_paranoid
	

	has_many :demandes
	has_many :paiements
	has_many :annees, dependent: :destroy
	has_many :dispos, dependent: :destroy
	belongs_to :teacher
	has_many :inscriptions, dependent: :destroy
	has_many :lessons
	has_many :contactmessages
	has_many :absences
	after_validation :affichage_lieu, on: [ :create, :update ]

	#after_create :reminder
=begin
	def reminder
		@twilio_number = ENV['TWILIO_NUMBER']
	    account_sid = ENV['TWILIO_ACCOUNT_SID']
	    @client = Twilio::REST::Client.new(account_sid, ENV['TWILIO_AUTH_TOKEN'])
	    teacher_phone = "+33" + self.teacher.infoteacher.phone
	    #time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
	    #reminder = "Hi #{self.name}. Just a reminder that you have an appointment coming up at #{time_str}."
	    reminder = "Hi! A quick reminder."
	    message = @client.api.account.messages.create(
	      :from => '+33644640536',
	      #:to => self.phone_number,
	      :to => teacher_phone,
	      :body => reminder,
	    )
	end
=end

	private

	def affichage_lieu
		self.lieu_court = self.route + ", " + self.postal_code + ", " + self.locality
	end
end
