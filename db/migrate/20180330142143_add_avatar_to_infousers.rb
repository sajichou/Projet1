class AddAvatarToInfousers < ActiveRecord::Migration[5.1]
def self.up
    change_table :infousers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :infousers, :avatar
  end
end
