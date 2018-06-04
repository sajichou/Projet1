class AddColumnsToLessons < ActiveRecord::Migration[5.1]
  def change
  	add_column :lessons, :complaints, :integer
  	add_column :lessons, :in_fav_of_users, :bool
  	add_column :lessons, :paid, :bool
  end
end
