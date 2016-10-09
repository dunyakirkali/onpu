class RemoveCoverFieldsFromJingles < ActiveRecord::Migration[5.0]
  def self.up
    remove_attachment :jingles, :cover
  end

  def self.down
    change_table :jingles do |t|
      t.attachment :cover
    end
  end
end
