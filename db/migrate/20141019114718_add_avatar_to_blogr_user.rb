class AddAvatarToBlogrUser < ActiveRecord::Migration
  def change
    add_column :blogr_users, :avatar, :string
  end
end
