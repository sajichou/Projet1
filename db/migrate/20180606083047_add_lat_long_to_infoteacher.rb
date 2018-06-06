class AddLatLongToInfoteacher < ActiveRecord::Migration[5.1]
  def change
  	add_column :infoteachers, :latitude, :float
  	add_column :infoteachers, :longitude, :float
  end
end
