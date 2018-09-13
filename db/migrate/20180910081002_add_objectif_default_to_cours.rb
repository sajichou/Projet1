class AddObjectifDefaultToCours < ActiveRecord::Migration[5.1]
  def change
  	change_column :cours, :objectif, :integer, :default => 0
  end
end
