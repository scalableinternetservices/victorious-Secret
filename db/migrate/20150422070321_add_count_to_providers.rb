class AddCountToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :count, :integer, default: 0
  end
end
