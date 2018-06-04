class AddColumnToPresences < ActiveRecord::Migration[5.1]
  def change
  	add_column :presences, :charge_id, :integer
  end
end
