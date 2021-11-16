class CreateTagsActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :tags_activities do |t|
      t.integer :tags_id
      t.integer :activities_id

      t.timestamps
    end
  end
end
