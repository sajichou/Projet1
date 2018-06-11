class AddMintoDispo < ActiveRecord::Migration[5.1]
  def change
  	add_column :dispos, :min, :integer, :default => 0
  end
end
