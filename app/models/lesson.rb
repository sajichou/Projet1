class Lesson < ActiveRecord::Base
	belongs_to :cour
	has_many :presences
end
