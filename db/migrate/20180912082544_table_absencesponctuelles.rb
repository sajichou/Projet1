class TableAbsencesponctuelles < ActiveRecord::Migration[5.1]
  def change
  	create_table :absencesponctuelles 
  	add_column :absencesponctuelles, :cour_id, :integer
  	add_column :absencesponctuelles, :user_id, :integer
  	add_column :absencesponctuelles, :lesson_id, :integer
  	add_column :absencesponctuelles, :created_at, :datetime
  end
end
