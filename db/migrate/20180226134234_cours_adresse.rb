class CoursAdresse < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :lieu, :string
  end
end
