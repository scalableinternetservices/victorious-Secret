class WelcomeController < ApplicationController
  def index
  	
  	@posts = Post.paginate(:page => params[:page], :per_page => 30)
    
  end


  def consumer_side 
  	# @posts_update = []
   #  Notification.all.each do |n|
   #    unless n.bid.nil?
   #      if n.bid.post.consumer == current_user.consumer
   #        @posts_update << n.bid.post
   #      end
   #    end
   #  end
  	@posts = current_user.consumer.posts.paginate(:page => params[:page], :per_page => 30)
  end

  def provider_side 
  	@posts = []
  	provider_bids = current_user.provider.bids
  end

  def provider_side 
  	@posts = []
  	provider_bids = current_user.provider.bids
  	provider_bids.each do |bid|
  		@posts << bid.post
    end
   # @posts_provider_update = []
   # Notification.all.each do |n|
   #  unless n.post.nil?
   #    if n.post.provider == current_user.provider
   #      @posts_provider_update << n.post
   #    end
   #  end
   # end
  end


  def view_profile
	  if params.has_key?("user_id")
		  @user = User.find(params[:user_id])
	  else
		  @user = current_user
	  end

    @reviews = []
    Proreview.order(:created_at).each do |x|
      if x.post.provider == @user.provider
        @reviews << x
      end

    end

    @reviews_con = []
    Conreview.order(:created_at).each do |x|
      if x.post.consumer == @user.consumer
        @reviews_con << x
      end
    end


  end



end
	
