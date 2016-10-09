class AddImageIdToJingles < ActiveRecord::Migration[5.0]
  def change
    add_reference :jingles, :image, foreign_key: true
  end
end
