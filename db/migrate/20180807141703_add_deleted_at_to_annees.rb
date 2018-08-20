class AddDeletedAtToAnnees < ActiveRecord::Migration[5.1]
  def change
    add_column :annees, :deleted_at, :datetime
    add_index :annees, :deleted_at
  end
end
