class AddNameAndAgeAndPhoneAndAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :phone, :string, precision: 10
    add_column :users, :address, :text
  end
end
