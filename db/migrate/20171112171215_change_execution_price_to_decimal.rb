class ChangeExecutionPriceToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :trades, :execution_price, "numeric USING CAST(execution_price AS numeric)"
    change_column :trades, :execution_price, :decimal, precision: 7, scale: 3
  end
end
