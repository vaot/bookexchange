class AddDominantColorToMedia < ActiveRecord::Migration
  def change
    add_column :media, :dominant_color, :string
  end
end
