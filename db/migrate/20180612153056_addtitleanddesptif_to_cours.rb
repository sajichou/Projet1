class AddtitleanddesptifToCours < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :titre, :string
  	add_column :cours, :descriptif, :string
  end
end
