class AddDeletedAtToInfoteachers < ActiveRecord::Migration[5.1]
  def change
    add_column :infoteachers, :deleted_at, :datetime
    add_index :infoteachers, :deleted_at
  end
end
