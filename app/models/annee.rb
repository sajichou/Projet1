class Annee < ApplicationRecord
	belongs_to :cour
	belongs_to :teacher
end