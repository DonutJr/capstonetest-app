class AddSupplyToCoins < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :supply, :integer
  end
end
