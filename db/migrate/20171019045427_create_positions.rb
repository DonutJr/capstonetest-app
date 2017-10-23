class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
