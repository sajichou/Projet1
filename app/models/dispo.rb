class Dispo < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :cour
end