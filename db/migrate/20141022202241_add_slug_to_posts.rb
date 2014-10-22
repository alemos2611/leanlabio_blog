class AddSlugToPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :slug, :string
    add_index :blogr_posts, :slug, unique: true
  end
end
