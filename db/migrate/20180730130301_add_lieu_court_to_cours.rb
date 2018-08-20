class AddLieuCourtToCours < ActiveRecord::Migration[5.1]
  def change
  	add_column :cours, :lieu_court, :string
  end
end
