class CreateWeightToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :weight, :float
  end
end
