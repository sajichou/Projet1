class AddColumnToPresence < ActiveRecord::Migration[5.1]
  def change
  	add_column :presences, :absence, :boolean, :default => false
  end
end
