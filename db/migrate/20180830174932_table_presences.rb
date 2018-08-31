class TablePresences < ActiveRecord::Migration[5.1]
  def change
  	create_table :presences 
  	add_column :presences, :lesson_id, :integer
  	add_column :presences, :user_id, :integer
  	add_column :presences, :perf, :bool
  	add_column :presences, :stripe_charge, :string
  	add_column :presences, :deleted_at, :datetime
  end
end
