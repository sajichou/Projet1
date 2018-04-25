class TableDispos < ActiveRecord::Migration[5.1]
  def change
  	create_table :dispos
  	add_column :dispos, :cour_id, :integer
  	add_column :dispos, :jour, :string
  	add_column :dispos, :heure, :integer
  end
end
