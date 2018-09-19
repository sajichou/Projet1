class Paiement < ActiveRecord::Base
	acts_as_paranoid
	
	belongs_to :user
	belongs_to :teacher
	belongs_to :lesson


	def user
    	User.unscoped { super }
	end

	def teacher
    	Teacher.unscoped { super }
	end

end