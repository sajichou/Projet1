class AddColumnsToCours < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :latitude, :float
  	add_column :cours, :longitude, :float
  end
end
