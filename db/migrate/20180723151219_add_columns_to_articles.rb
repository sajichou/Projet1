class AddColumnsToArticles < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :accroche, :string
  	add_column :articles, :date, :string
  end
end
