class AddAttachmentCoverToJingles < ActiveRecord::Migration
  def self.up
    change_table :jingles do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :jingles, :cover
  end
end
