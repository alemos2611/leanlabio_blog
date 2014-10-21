class RenameUsersToAuthors < ActiveRecord::Migration
  def change
    rename_table :blogr_users, :blogr_authors
  end
end
