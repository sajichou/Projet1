class AddColumnsToCoursForMonthAndYear < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :mois, :integer
  	add_column :cours, :annee, :integer
  end
end
