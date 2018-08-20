class AddDeletedAtToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :deleted_at, :datetime
    add_index :teachers, :deleted_at
  end
end
