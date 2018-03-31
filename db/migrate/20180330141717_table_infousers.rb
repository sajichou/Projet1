class TableInfousers < ActiveRecord::Migration[5.1]
  def change
  	create_table :infousers
  	add_column :infousers, :user_id, :integer, :index => true
  	add_column :infousers, :first_name, :string
  	add_column :infousers, :last_name, :string
  	add_column :infousers, :phone, :string
  	add_column :infousers, :location, :string

  end
end
