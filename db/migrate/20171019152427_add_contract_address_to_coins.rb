class AddContractAddressToCoins < ActiveRecord::Migration[5.1]
  def change
        add_column :coins, :contract_address, :string

  end
end
