class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :price
      t.integer :owner_id
      t.string :owner_type

      t.timestamps
    end

    add_index :bids, :owner_id
  end
end
