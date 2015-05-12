class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :consumers, :rating , :decimal, precision: 3, scale: 2
  	change_column :providers, :rating, :decimal,precision: 3, scale: 2
  end
end
