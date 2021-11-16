class AddForeignKeyActivitiesToCities < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :activities, :cities
  end
end
