class AddFewColumnsToBook < ActiveRecord::Migration
  def change
    add_column :books, :accept_offers, :boolean, default: true
    add_column :books, :show_offers, :boolean, default: true
    add_column :books, :auctioning_enable, :boolean, default: true
  end
end
