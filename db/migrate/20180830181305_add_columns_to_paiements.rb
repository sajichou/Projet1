class AddColumnsToPaiements < ActiveRecord::Migration[5.1]
  def change
  	add_column :paiements, :amount_eleve, :float
  	add_column :paiements, :amount_prof, :float
  end
end
