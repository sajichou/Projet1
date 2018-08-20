class Contactmessages < ActiveRecord::Migration[5.1]
  def change
  	create_table :contactmessages 
  	add_column :contactmessages, :cour_id, :integer
  	add_column :contactmessages, :user_id, :integer
  	add_column :contactmessages, :message, :text
  	add_column :contactmessages, :created_at, :datetime
  end
end
