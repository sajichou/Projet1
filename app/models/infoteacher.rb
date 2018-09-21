class Infoteacher < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :teacher, :foreign_key => 'teacher_id'
	#validates_length_of :methodology, :minimum => 5, :maximum => 40, :allow_blank => true
	#validates_length_of :experience, :minimum => 5, :maximum => 40, :allow_blank => true

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#", :normal => "200x200#" }
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	has_attached_file :justificatif_diplome, :styles => { :medium => "600x600>", :thumb => "100x100#" }
	validates_attachment_content_type :justificatif_diplome, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']

	has_attached_file :justificatif_identite, :styles => { :medium => "600x600>", :thumb => "100x100#" }
	validates_attachment_content_type :justificatif_identite, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']	#validates :last_name, presence: true
	#validates :phone, presence: true
	#validates :avatar, presence: true
	#validates :location, presence: true


end