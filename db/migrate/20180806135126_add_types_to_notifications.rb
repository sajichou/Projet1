class AddTypesToNotifications < ActiveRecord::Migration[5.1]
  def change
  	add_column :notifications, :recipient_type, :string
  	add_column :notifications, :actor_type, :string
  end
end
