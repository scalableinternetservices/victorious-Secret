class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :post, index: true
      t.references :bid, index: true

      t.timestamps
    end
  end
end
