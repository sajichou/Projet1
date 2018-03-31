class TableRoles < ActiveRecord::Migration[5.1]
  def change
  	create_table :roles 
  	add_column :roles, :teacher_id, :integer, :index => true
  	add_column :roles, :power, :integer, :default => 0
  end
end
