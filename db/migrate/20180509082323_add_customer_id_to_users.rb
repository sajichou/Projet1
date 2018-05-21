class AddCustomerIdToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :infousers, :stripe_customer_id, :string
  end
end
