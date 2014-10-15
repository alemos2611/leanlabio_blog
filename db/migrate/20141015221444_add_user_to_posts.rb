class AddUserToPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :user_id, :integer
  end
end
