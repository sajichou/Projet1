class AddDeletedAtToDispos < ActiveRecord::Migration[5.1]
  def change
    add_column :dispos, :deleted_at, :datetime
    add_index :dispos, :deleted_at
  end
end
