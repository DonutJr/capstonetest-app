class ChangeCurrentPriceToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :coins, :current_price, "numeric USING CAST(current_price AS numeric)"
    change_column :coins, :current_price, :decimal, precision: 7, scale: 3
  end
end
