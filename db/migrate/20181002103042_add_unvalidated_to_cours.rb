class AddUnvalidatedToCours < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :validated, :bool, default: false
  end
end
