class Role < ActiveRecord::Base
	belongs_to :teacher, :foreign_key => 'teacher_id'
end