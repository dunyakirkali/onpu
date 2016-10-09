class AddAudioIdToJingles < ActiveRecord::Migration[5.0]
  def change
    add_reference :jingles, :audio, foreign_key: true
  end
end
