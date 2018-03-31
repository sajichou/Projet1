class TableInscriptions < ActiveRecord::Migration[5.1]
  def change
  	create_table :inscriptions 
  	add_column :inscriptions, :cours_id, :integer
  	add_column :inscriptions, :eleves_id, :integer

  end
end
