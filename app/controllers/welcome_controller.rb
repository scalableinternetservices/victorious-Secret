class WelcomeController < ApplicationController
  def index
  	
  	@posts = Post.all()
    
  end


  def consumer_side 
  	@posts_update = []
    Notification.all.each do |n|
      unless n.bid.nil?
        if n.bid.post.consumer = current_user.consumer
          @posts_update << n.bid.post
        end
        

      end

    end

  	@posts = current_user.consumer.posts
  end

  def provider_side 
  	@posts = []
  	provider_bids = current_user.provider.bids
  	current_user.provider.bids.each do |bid|
  		@posts << bid.post
	end

   @posts_provider_update = []
   Notification.all.each do |n|
    unless n.post.nil?
      if n.post.provider = current_user.provider
        @posts_provider_update << n.post
      end

    end

   end



  end


end
	
