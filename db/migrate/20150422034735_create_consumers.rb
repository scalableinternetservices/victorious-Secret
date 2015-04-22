class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.belongs_to :user, index: true
      t.integer :rating, default: 0

      t.timestamps
    end
  end
end
