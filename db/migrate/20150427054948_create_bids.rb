class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :provider, index: true
      t.belongs_to :post, index: true
      t.integer :amount
      t.text :description

      t.timestamps
    end
  end
end
