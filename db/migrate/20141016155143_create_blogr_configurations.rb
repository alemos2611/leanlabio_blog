class CreateBlogrConfigurations < ActiveRecord::Migration
  def change
    create_table :blogr_configs do |t|
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords

      t.timestamps
    end
  end
end
