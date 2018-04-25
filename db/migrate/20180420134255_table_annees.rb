class TableAnnees < ActiveRecord::Migration[5.1]
  def change
  	create_table :annees
  	add_column :annees, :cour_id, :integer
  	add_column :annees, :teacher_id, :integer
  	add_column :annees, :niveau, :integer, :default => 0
  end
end
