class RenameArticlesToBlogs < ActiveRecord::Migration[5.1]
  def change
  	rename_table :articles, :blogs
  end
end
