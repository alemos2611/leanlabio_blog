class ChangeUsrIdtoAuthorIdInPosts < ActiveRecord::Migration
  def change
    rename_column :blogr_posts, :user_id, :author_id
  end
end
