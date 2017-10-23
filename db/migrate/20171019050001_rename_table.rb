class RenameTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :positions, :wallets
  end
end
