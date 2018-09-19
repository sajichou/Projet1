class AddColumnTopaiements < ActiveRecord::Migration[5.1]
  def change
  	add_column :paiements, :deleted_at, :datetime
    add_index :paiements, :deleted_at
  end
end
