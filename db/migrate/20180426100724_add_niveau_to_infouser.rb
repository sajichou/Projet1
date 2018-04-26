class AddNiveauToInfouser < ActiveRecord::Migration[5.1]
  def change
  	add_column :infousers, :niveau, :integer
  end
end
