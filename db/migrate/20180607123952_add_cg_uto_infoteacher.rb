class AddCgUtoInfoteacher < ActiveRecord::Migration[5.1]
  def change
  	add_column :infoteachers, :cgu, :bool
  end
end
