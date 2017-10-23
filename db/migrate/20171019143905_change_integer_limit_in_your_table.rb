class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[5.1]
  def change
    change_column :coins, :supply, :integer, limit: 8
  end
end
