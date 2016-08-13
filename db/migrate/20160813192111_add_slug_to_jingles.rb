class AddSlugToJingles < ActiveRecord::Migration[5.0]
  def change
    add_column :jingles, :slug, :string
    add_index :jingles, :slug, unique: true
  end
end
