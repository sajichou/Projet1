class RenameTableHistoPaiement < ActiveRecord::Migration[5.1]
  def change
  	rename_table :historiquepaiements, :paiements
  end
end
