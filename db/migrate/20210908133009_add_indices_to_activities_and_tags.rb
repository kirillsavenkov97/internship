class AddIndicesToActivitiesAndTags < ActiveRecord::Migration[6.1]
  def change
    add_index :activities, :city_id
    add_index :activities, :id
    add_index :tags, :id
  end
end
