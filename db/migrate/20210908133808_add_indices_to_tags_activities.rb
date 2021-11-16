class AddIndicesToTagsActivities < ActiveRecord::Migration[6.1]
  def change
    add_index :tags_activities, :tag_id
    add_index :tags_activities, :activity_id
  end
end
