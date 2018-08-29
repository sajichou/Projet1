class Demande < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :cour
	belongs_to :teacher
	belongs_to :user
end