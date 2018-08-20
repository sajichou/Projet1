class Inscription < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :cour
end
