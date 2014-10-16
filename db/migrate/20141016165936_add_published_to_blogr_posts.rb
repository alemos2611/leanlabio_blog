class AddPublishedToBlogrPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :published, :boolean, default: false
  end
end
