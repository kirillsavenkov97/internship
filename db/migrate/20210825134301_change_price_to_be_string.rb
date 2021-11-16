class ChangePriceToBeString < ActiveRecord::Migration[6.1]
  def change
    change_column :activities, :price, :string
  end
end
