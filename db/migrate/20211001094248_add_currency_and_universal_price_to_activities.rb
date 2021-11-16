class AddCurrencyAndUniversalPriceToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :currency, :string
    change_column :activities, :price, :integer
  end
end
