class AddAttachmentJustificatifDiplomeToInfoteachers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :infoteachers do |t|
      t.attachment :justificatif_diplome
    end
  end

  def self.down
    remove_attachment :infoteachers, :justificatif_diplome
  end
end
