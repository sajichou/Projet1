class AddDeuserToContactmessages < ActiveRecord::Migration[5.1]
  def change
  	add_column :contactmessages, :ecritparuser, :boolean
  end
end
