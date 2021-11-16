class AddForeignKeyTagsActivitiesToActivities < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :tags_activities, :activities
  end
end
