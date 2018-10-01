class AddColumnToInfoteachers < ActiveRecord::Migration[5.1]
  def change
  	add_column :infoteachers, :updated_at, :datetime
  end
end
