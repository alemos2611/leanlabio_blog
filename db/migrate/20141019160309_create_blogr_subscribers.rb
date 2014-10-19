class CreateBlogrSubscribers < ActiveRecord::Migration
  def change
    create_table :blogr_subscribers do |t|
      t.string :email

      t.timestamps
    end
  end
end
