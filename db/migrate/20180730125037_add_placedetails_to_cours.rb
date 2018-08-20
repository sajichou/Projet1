class AddPlacedetailsToCours < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :street_number, :string
  	add_column :cours, :route, :string
  	add_column :cours, :postal_code, :string
  	add_column :cours, :locality, :string
  	add_column :cours, :country, :string
  end
end
