class Contactmessage < ActiveRecord::Base
	acts_as_paranoid
	
	belongs_to :teacher
	belongs_to :user
	belongs_to :cour

	def user
	  User.unscoped { super }
	end

  	def teacher
	  Teacher.unscoped { super }
	end


	def cour
	  Cour.unscoped { super }
	end

end