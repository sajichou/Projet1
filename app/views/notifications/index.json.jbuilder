json.array! @notifications do |notification|
  json.id notification.id
  json.unread !notification.read_at?
  #json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]
  json.template render partial: "notification", locals: {notification: notification}, formats: [:html]

  #json.recipient notification.recipient
  #json.actor notification.actor.username
  #json.action notification.action
  #json.notifiable do #notification.notifiable
    #json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  #end
  #json.url forum_thread_path(notification.notifiable.forum_thread, anchor: dom_id(notification.notifiable))
end

=begin
json.array! @notifications do |notification| 
    json.actor notification.actor
    json.action notification.action 
    json.notifiable do #notification_notifiable 
    json.type "a comment"
	end
	json.url messages_show_path(:message_id => notification.notifiable_id ) 
end 
=end