class AddTimestampToTrades < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :timestamp, :string
  end
end
