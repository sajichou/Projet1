class Absence < ApplicationRecord
	belongs_to :cour
	belongs_to :user
end