class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.integer :age
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
