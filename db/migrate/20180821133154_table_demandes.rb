class TableDemandes < ActiveRecord::Migration[5.1]
  def change
  	create_table :demandes 
  	add_column :demandes, :teacher_id, :integer
  	add_column :demandes, :cour_id, :integer
  	add_column :demandes, :user_id, :integer
    add_column :demandes, :jour, :string
    add_column :demandes, :heure, :integer
    add_column :demandes, :min, :integer
  	add_column :demandes, :state, :boolean
  	add_column :demandes, :created_at, :datetime
  	add_column :demandes, :deleted_at, :datetime
    add_index :demandes, :deleted_at
  end
end
