class TableChapitres < ActiveRecord::Migration[5.1]
  def change
    create_table :chapitres 
  	add_column :chapitres, :lesson_id, :integer
  	add_column :chapitres, :topic_id, :integer
  end
end
