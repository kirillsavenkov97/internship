class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.integer :city_id
      t.string :title
      t.string :description
      t.string :photo
      t.integer :price
      t.integer :customers_review_rating

      t.timestamps
    end
  end
end
