class DefaultColumnToInfouser < ActiveRecord::Migration[5.1]
  def change
  	change_column :infousers, :code_used, :bool, :default => true
  end
end
