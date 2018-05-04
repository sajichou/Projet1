class ConfirmableTeachers < ActiveRecord::Migration[5.1]
  def change
  	  	 ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable
      add_column :teachers, :confirmation_token, :string
      add_column :teachers, :confirmed_at, :datetime
      add_column :teachers, :confirmation_sent_at, :datetime
      add_column :teachers, :unconfirmed_email, :string
  end
end
