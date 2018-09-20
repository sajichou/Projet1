class Notification < ActiveRecord::Base
    belongs_to :recipient, polymorphic: true
    belongs_to :actor, polymorphic: true
    belongs_to :notifiable, polymorphic: true
    scope :unread, ->{ where(read_at: nil) }
  	scope :recent, ->{ order(created_at: :desc).limit(5) }

  def user
	  User.unscoped { super }
	end

  def teacher
	  Teacher.unscoped { super }
	end

end