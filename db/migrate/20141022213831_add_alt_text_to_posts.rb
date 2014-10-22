class AddAltTextToPosts < ActiveRecord::Migration
  def change
    add_column :blogr_posts, :img_alt_text, :string
  end
end
