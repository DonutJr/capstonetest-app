class RemoveDirectionFromAlerts < ActiveRecord::Migration[5.1]
  def change
    remove_column :alerts, :direction, :string

  end
end
