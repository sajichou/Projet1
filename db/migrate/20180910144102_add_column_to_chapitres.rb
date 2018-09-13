class AddColumnToChapitres < ActiveRecord::Migration[5.1]
  def change
  	add_column :chapitres, :cour_id, :integer
  end
end
