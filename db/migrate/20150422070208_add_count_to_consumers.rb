class AddCountToConsumers < ActiveRecord::Migration
  def change
    add_column :consumers, :count, :integer,default: 0
  end
end
