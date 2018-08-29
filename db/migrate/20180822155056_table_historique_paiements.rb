class TableHistoriquePaiements < ActiveRecord::Migration[5.1]
  def change
  	create_table :historiquepaiements 
  	add_column :historiquepaiements, :teacher_id, :integer
  	add_column :historiquepaiements, :cour_id, :integer
  	add_column :historiquepaiements, :user_id, :integer
    add_column :historiquepaiements, :lesson_id, :string
  	add_column :historiquepaiements, :created_at, :datetime
  end
end
