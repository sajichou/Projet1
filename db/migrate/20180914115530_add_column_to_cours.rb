class AddColumnToCours < ActiveRecord::Migration[5.1]
  def change

    add_column :cours, :theme, :string, array: true, default: []
  
  end
end
