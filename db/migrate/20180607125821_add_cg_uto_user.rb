class AddCgUtoUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :infousers, :cgu, :bool
  end
end
