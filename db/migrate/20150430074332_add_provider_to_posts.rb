class AddProviderToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :provider, index: true
  end
end
