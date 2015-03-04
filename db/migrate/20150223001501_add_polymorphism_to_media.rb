class AddPolymorphismToMedia < ActiveRecord::Migration
  def change
    add_column :media, :owner_id, :integer
    add_column :media, :owner_type, :string
    add_index :media, :owner_type
    add_index :media, :owner_id
  end
end
