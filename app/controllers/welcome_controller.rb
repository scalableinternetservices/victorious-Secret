class WelcomeController < ApplicationController
  def index
  	
  	@posts = Post.all()
  end


  def consumer_side 
  	
  	@posts = current_user.consumer.posts
  end

  def provider_side 
  	@posts = []
  	provider_bids = current_user.provider.bids
  	current_user.provider.bids.each do |bid|
  		@posts << bid.post
	end


  end


end
	
