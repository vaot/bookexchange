class AddVisibilityToBooks < ActiveRecord::Migration
  def change
    add_column :books, :visibility, :string, null: false, default: 'public'
    add_index :books, :visibility
  end
end
