class CreateConreviews < ActiveRecord::Migration
  def change
    create_table :conreviews do |t|
      t.integer :rating
      t.text :description
      t.belongs_to :provider, index: true
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
