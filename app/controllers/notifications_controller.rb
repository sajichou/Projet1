class NotificationsController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => [:mark_as_read]

    def index 
    	if user_signed_in?
        	@notifications = Notification.where(recipient: current_user).recent
        elsif teacher_signed_in?
        	@notifications = Notification.where(recipient: current_teacher).recent
        end
    end 

    def mark_as_read 
    	if user_signed_in?
	    	@notifications = Notification.where(recipient: current_user).unread
	    elsif teacher_signed_in?
	     	@notifications = Notification.where(recipient: current_teacher).unread
	    end
	    @notifications.update_all(read_at: Time.zone.now)
	    render json: {success: true}
	end 

end
