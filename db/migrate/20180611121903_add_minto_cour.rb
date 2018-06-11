class AddMintoCour < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :min, :integer, :default => 0
  	add_column :cours, :min_ex, :integer, :default => 0
  end
end
