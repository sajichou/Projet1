class AddAttachmentJustificatifIdentiteToInfoteachers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :infoteachers do |t|
      t.attachment :justificatif_identite
    end
  end

  def self.down
    remove_attachment :infoteachers, :justificatif_identite
  end
end
