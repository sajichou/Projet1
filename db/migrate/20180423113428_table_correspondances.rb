class TableCorrespondances < ActiveRecord::Migration[5.1]
  def change
  	create_table :correspondances
  	add_column :correspondances, :niveau_id, :integer
  	add_column :correspondances, :nom, :string
  end
end
