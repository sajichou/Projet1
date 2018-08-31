class TableCommentaires < ActiveRecord::Migration[5.1]
  def change
  	create_table :commentaires
  	add_column :commentaires, :user_id, :integer
  	add_column :commentaires, :cour_id, :integer
  	add_column :commentaires, :contenu, :string
  	add_column :commentaires, :date, :string
  	add_column :commentaires, :created_at, :datetime
  end
end
