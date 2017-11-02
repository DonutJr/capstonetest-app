class AddCurrentPriceToAlerts < ActiveRecord::Migration[5.1]
  def change
    add_column :alerts, :current_price, :decimal, precision: 7, scale: 3
  end
end
