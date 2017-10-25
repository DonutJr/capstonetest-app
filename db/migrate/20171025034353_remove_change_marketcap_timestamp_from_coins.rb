class RemoveChangeMarketcapTimestampFromCoins < ActiveRecord::Migration[5.1]
  def change
    remove_column :coins, :change, :integer
    remove_column :coins, :marketcap, :integer
    remove_column :coins, :timestamp, :string

  end
end
