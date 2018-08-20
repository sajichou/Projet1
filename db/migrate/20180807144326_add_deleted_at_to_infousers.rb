class AddDeletedAtToInfousers < ActiveRecord::Migration[5.1]
  def change
    add_column :infousers, :deleted_at, :datetime
    add_index :infousers, :deleted_at
  end
end
