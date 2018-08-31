class TableAbsences < ActiveRecord::Migration[5.1]
  def change
  	create_table :absences 
  	add_column :absences, :user_id, :integer
  	add_column :absences, :cour_id, :integer
  	add_column :absences, :date, :string
  	add_column :absences, :deleted_at, :datetime
  end
end
