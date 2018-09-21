class Lesson < ActiveRecord::Base
	acts_as_paranoid

	belongs_to :cour
	has_many :presences
	has_many :alertes
	has_many :paiements
	has_many :absencesponctuelles

	def cour
    	Cour.unscoped { super }
  	end
  	
end
