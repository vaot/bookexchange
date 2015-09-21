class CreateAuthKeys < ActiveRecord::Migration
  def change
    create_table :auth_keys do |t|
      t.integer :owner_id
      t.datetime :expires_at
      t.string :owner_type
      t.string :auth_key, null: false

      t.timestamps
    end
  end
end
