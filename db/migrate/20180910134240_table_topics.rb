class TableTopics < ActiveRecord::Migration[5.1]
  def change
  	create_table :topics 
  	add_column :topics, :niveau_id, :integer
  	add_column :topics, :matiere, :string
  	add_column :topics, :theme, :string
  	add_column :topics, :chapitre, :string
  end
end
