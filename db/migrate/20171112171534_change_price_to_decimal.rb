class ChangePriceToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :pings, :price, "numeric USING CAST(price AS numeric)"
    change_column :pings, :price, :decimal, precision: 7, scale: 3
  end
end
