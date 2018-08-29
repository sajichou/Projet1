class TableAlertes < ActiveRecord::Migration[5.1]
  def change
  	create_table :alertes
  	add_column :alertes, :lesson_id, :integer
    add_column :alertes, :error, :boolean
  end
end
