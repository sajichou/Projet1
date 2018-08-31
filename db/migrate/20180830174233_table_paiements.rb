class TablePaiements < ActiveRecord::Migration[5.1]
  def change
  	create_table :paiements 
  	add_column :paiements, :teacher_id, :integer
  	add_column :paiements, :user_id, :integer
    add_column :paiements, :lesson_id, :integer
  	add_column :paiements, :created_at, :datetime
  end
end


