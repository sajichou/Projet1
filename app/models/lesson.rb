class Lesson < ActiveRecord::Base
	belongs_to :cour
	has_many :presences
	has_many :alertes
	has_many :paiements
end
