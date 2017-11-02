class RemoveTickerFromAlerts < ActiveRecord::Migration[5.1]
  def change
    remove_column :alerts, :ticker, :string
  end
end
