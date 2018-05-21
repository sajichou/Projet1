class AddStripeIdToInfoteacher < ActiveRecord::Migration[5.1]
  def change
  	add_column :infoteachers, :stripe_id, :string
  end
end
