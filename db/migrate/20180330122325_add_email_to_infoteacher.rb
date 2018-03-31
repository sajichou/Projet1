class AddEmailToInfoteacher < ActiveRecord::Migration[5.1]
  def change
  	add_column :infoteachers, :email, :string
  end
end

