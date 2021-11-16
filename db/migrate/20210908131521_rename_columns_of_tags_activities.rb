class RenameColumnsOfTagsActivities < ActiveRecord::Migration[6.1]
  def change
    rename_column :tags_activities, :tags_id, :tag_id
    rename_column :tags_activities, :activities_id, :activity_id
  end
end
