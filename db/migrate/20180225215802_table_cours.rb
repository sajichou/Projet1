class TableCours < ActiveRecord::Migration[5.1]
  def change
  	create_table :cours 
  	add_column :cours, :matiere, :string
  	add_column :cours, :jour, :string
  	add_column :cours, :nombre_eleves, :integer
  end
end
