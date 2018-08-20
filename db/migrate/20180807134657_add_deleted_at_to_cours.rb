class AddDeletedAtToCours < ActiveRecord::Migration[5.1]
  def change
    add_column :cours, :deleted_at, :datetime
    add_index :cours, :deleted_at
  end
end
