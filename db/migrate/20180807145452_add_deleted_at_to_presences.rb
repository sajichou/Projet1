class AddDeletedAtToPresences < ActiveRecord::Migration[5.1]
  def change
    add_column :presences, :deleted_at, :datetime
    add_index :presences, :deleted_at
  end
end
