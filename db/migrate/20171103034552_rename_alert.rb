class RenameAlert < ActiveRecord::Migration[5.1]
  def change
    rename_table :alerts, :pings
  end
end
