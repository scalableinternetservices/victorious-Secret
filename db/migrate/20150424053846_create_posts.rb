class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :picture
      t.belongs_to :consumer, index: true

      t.timestamps
    end
  end
end
