class AddDptmtoteacher < ActiveRecord::Migration[5.1]
  def change
  	add_column :infoteachers, :dptm, :string
  end
end
