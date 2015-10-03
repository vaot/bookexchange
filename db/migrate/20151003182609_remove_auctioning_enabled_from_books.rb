class RemoveAuctioningEnabledFromBooks < ActiveRecord::Migration
  def up
    remove_column :books, :auctioning_enabled
  end

  def down
    add_column :books, :auctioning_enabled, :boolean, default: true
  end
end
