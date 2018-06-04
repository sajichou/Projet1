class AddDateRegToCour < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :date_reg, :string
  	add_column :cours, :date_ex, :string
  	add_column :cours, :horaire_ex, :string
  end
end
