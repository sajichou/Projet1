class AddDeletedAtToInscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :inscriptions, :deleted_at, :datetime
    add_index :inscriptions, :deleted_at
  end
end
