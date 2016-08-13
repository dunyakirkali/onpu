class AddAttachmentAudioToJingles < ActiveRecord::Migration
  def self.up
    change_table :jingles do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :jingles, :audio
  end
end
