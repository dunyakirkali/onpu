class AddAttachmentFileToAudios < ActiveRecord::Migration
  def self.up
    change_table :audios do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :audios, :file
  end
end
