class AddHeaderImageToBlogrPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :header, :string
  end
end
