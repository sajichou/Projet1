class AddHeureToCours < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :heure, :integer
  end
end
