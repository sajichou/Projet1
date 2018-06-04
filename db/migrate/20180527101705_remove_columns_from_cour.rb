class RemoveColumnsFromCour < ActiveRecord::Migration[5.1]
  def change
  	remove_column :cours, :date
  	remove_column :cours, :mois
  	remove_column :cours, :annee
  	remove_column :cours, :jour_prochain
  end
end
