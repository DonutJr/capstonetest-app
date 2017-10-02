class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.string :ticker
      t.string :name
      t.integer :current_price
      t.integer :change
      t.integer :marketcap
      t.string :timestamp

      t.timestamps
    end
  end
end
