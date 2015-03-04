class AddMediaModel < ActiveRecord::Migration
  def up
    add_attachment :books, :media
  end

  def down
    remove_attachment :books, :media
  end
end
