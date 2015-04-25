class AddProvider < ActiveRecord::Migration
  def up
  	User.all.each do |user|
  		if user.provider.nil?
  			user.provider = Provider.new()
  			user.save()
  		end
  	end
  end

  def down
  	
  end

end
