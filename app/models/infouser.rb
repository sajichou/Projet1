class Infouser < ActiveRecord::Base
	belongs_to :user, :foreign_key => 'user_id'
	#validates_length_of :methodology, :minimum => 5, :maximum => 40, :allow_blank => true
	#validates_length_of :experience, :minimum => 5, :maximum => 40, :allow_blank => true

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	#validates :first_name, presence: true
	#validates :last_name, presence: true
	#validates :phone, presence: true
	#validates :avatar, presence: true
	#validates :location, presence: true

end