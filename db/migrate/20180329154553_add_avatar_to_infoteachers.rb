class AddAvatarToInfoteachers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :infoteachers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :infoteachers, :avatar
  end
end
