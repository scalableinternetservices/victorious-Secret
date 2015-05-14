class AddLatAndLonToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :lat, :decimal, precision: 11, scale: 8
    add_column :posts, :lon, :decimal, precision: 12, scale: 8
  end
end
