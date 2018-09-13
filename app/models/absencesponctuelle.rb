class Absencesponctuelle < ApplicationRecord
	belongs_to :cour
	belongs_to :user
	belongs_to :lesson
end