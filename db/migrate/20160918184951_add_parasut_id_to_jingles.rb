class AddParasutIdToJingles < ActiveRecord::Migration[5.0]
  def change
    add_column :jingles, :parasut_id, :integer
  end
end
