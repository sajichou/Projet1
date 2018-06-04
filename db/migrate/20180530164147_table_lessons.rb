class TableLessons < ActiveRecord::Migration[5.1]
  def change
  	create_table :lessons 
  	add_column :lessons, :cour_id, :integer
  	add_column :lessons, :date, :string
  end
end
