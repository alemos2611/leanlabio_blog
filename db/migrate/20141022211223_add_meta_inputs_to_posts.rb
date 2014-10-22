class AddMetaInputsToPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :description, :text
    add_column :blogr_posts, :meta_keywords, :string
  end
end
