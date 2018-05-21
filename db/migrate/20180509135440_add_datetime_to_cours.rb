class AddDatetimeToCours < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :date, :datetime
  end
end
