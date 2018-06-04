class TableStripeCustomers < ActiveRecord::Migration[5.1]
  def change
  	create_table :stripe_customers 
  	add_column :stripe_customers, :user_id, :integer
  	add_column :stripe_customers, :cour_id, :integer
  	add_column :stripe_customers, :stripe_customer_id, :string
  end
end
