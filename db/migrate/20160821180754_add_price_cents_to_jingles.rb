class AddPriceCentsToJingles < ActiveRecord::Migration[5.0]
  def change
    add_monetize :jingles, :price
  end
end
