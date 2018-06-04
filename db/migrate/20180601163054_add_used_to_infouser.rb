class AddUsedToInfouser < ActiveRecord::Migration[5.1]
  def change
  	add_column :infousers, :code_used, :bool
  end
end
