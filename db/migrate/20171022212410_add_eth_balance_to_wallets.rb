class AddEthBalanceToWallets < ActiveRecord::Migration[5.1]
  def change
    add_column :wallets, :eth_balance, :decimal, precision: 10, scale: 3
  end
end
