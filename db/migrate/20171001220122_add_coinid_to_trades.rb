class AddCoinidToTrades < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :coin_id, :integer
  end
end
