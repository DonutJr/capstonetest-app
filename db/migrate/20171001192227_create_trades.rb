class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.integer :execution_price
      t.integer :quantity
      t.string :direction

      t.timestamps
    end
  end
end
