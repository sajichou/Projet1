class AddJourprochainToCours < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :jour_prochain, :integer
  end
end
