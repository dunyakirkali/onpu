class RemoveAudioFieldsFromJingles < ActiveRecord::Migration[5.0]
  def self.up
    remove_attachment :jingles, :audio
  end

  def self.down
    change_table :jingles do |t|
      t.attachment :audio
    end
  end
end
