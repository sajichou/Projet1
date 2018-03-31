class AddEmailToInfouser < ActiveRecord::Migration[5.1]
  def change
  	add_column :infousers, :email, :string
  end
end
