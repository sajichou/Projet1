class TableMatieres < ActiveRecord::Migration[5.1]
  def change
  	create_table :matieres 
  	add_column :matieres, :intern, :string
  	add_column :matieres, :extern, :string
  end
end
