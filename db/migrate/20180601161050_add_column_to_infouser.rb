class AddColumnToInfouser < ActiveRecord::Migration[5.1]
  def change
  	add_column :infousers, :code, :string
  end
end
