class AddDeletedAtToContactmessages < ActiveRecord::Migration[5.1]
  def change
    add_column :contactmessages, :deleted_at, :datetime
    add_index :contactmessages, :deleted_at
  end
end
