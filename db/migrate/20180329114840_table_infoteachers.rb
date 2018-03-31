class TableInfoteachers < ActiveRecord::Migration[5.1]
  def change
  	create_table :infoteachers
  	add_column :infoteachers, :teacher_id, :integer, :index => true
  	add_column :infoteachers, :first_name, :string
  	add_column :infoteachers, :last_name, :string
  	add_column :infoteachers, :phone, :string
  	add_column :infoteachers, :location, :string
  	add_column :infoteachers, :experience, :string
  	add_column :infoteachers, :methodology, :string
  end
end
