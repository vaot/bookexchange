class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :owner_id
      t.string :owner_type
      t.string :message
      t.string :status

      t.timestamps
    end

    add_index :notifications, :owner_id
  end
end
