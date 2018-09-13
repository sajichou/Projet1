class AddObjectifToCour < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :objectif, :integer
  end
end
