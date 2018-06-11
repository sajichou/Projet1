class AddDossierToInfoteacher < ActiveRecord::Migration[5.1]
  def change
  	add_column :infoteachers, :dossier, :integer, :default => 0
  end
end
