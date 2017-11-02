class CreateAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :alerts do |t|
      t.string :ticker
      t.integer :price
      t.string :direction
      t.integer :coin_id
      t.boolean :triggered
      t.integer :user_id

      t.timestamps
    end
  end
end
