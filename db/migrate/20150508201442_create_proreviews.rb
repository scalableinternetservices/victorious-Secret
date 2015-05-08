class CreateProreviews < ActiveRecord::Migration
  def change
    create_table :proreviews do |t|
      t.integer :rating
      t.text :description
      t.belongs_to :consumer, index: true
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
