class Cour < ActiveRecord::Base

	#geocoded_by :lieu, :params => {:countrycodes => "fr"}
	#after_validation :geocode, if: ->(obj){ obj.lieu.present? and obj.lieu_changed? }
	has_many :users
	has_many :annees, dependent: :destroy
	has_many :dispos, dependent: :destroy
	belongs_to :teacher
	has_many :inscriptions, dependent: :destroy
	has_many :lessons

end
