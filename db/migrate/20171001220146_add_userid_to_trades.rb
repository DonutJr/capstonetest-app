class AddUseridToTrades < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :user_id, :integer
  end
end
