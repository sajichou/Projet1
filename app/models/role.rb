class Role < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :teacher, :foreign_key => 'teacher_id'
end