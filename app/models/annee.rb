class Annee < ApplicationRecord
	acts_as_paranoid
	belongs_to :cour
	belongs_to :teacher
end