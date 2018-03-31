class RenameColumnToInscription < ActiveRecord::Migration[5.1]
  def change
  	rename_column :inscriptions, :cours_id, :cour_id
  	rename_column :inscriptions, :eleves_id, :user_id
  end
end
