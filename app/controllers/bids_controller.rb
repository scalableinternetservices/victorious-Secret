class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def accept
  	@bid = Bid.find(params[:bid_id])
  	@post = Post.find(params[:post_id])

    @post.provider = @bid.provider

    ##add notification
    notification = Notification.new()
    notification.bid = nil
    @post.notification = notification
    notification.save
    @post.save
  	redirect_to welcome_url,notice:"the provider has been notified of your acceptance"
  end


  def index
    @bids = Bid.all
    respond_with(@bids)
  end

  def show
    respond_with(@bid)
  end

  def new
    post = Post.find(params[:post_id])

    @post = post
    $flag = false
    #if the user has already bid on the item, he can edit his bid
    bids = post.bids
    bids.each do |bid|
      if bid.provider == current_user.provider
        $bid = bid
        $flag = true
      end
    end

    ##if the bidding is closed
    unless post.provider.nil?
      flag2 = true
    end

    if flag2
      redirect_to welcome_url,notice: 'sorry, the bid has been closed for this post'
    
    ##if the bidding is closed
    elsif $flag
      redirect_to action: :edit, id: $bid.id


      ##if the user hasn't bid on the post already 
    else
      if post.consumer.user == current_user
        respond_with do |format|
          format.html{redirect_to welcome_url, alert: 'cannot bid on your own post'}
        end
      else  
      @bid = Bid.new
      session[:post_id] = params[:post_id]
      respond_with(@bid)
    end
  end
  end

  def edit
    @post = @bid.post
  end

  

  def create
    if session[:post_id]
        @post = Post.find(session[:post_id])
        if !@post.provider.nil?
          flash[:alert] = 'user has already chosen a service provider'
          redirect_to welcome_url
        else 
            @bid = Bid.new(bid_params)
            
            @bid.post = @post
            @bid.provider = current_user.provider

            notification = Notification.new()
            notification.post = nil
            @bid.notification = notification

            respond_with do |format|
              if @bid.save
               format.html { redirect_to welcome_url, notice: 'Your bid has been placed' }
             else
               format.html { render action: 'new' }
               format.json { render json: @bid.errors, status: :unprocessable_entity }
             end
          end
        end

    else
      redirect_to welcome_url,error:'there was some problem'
    end


  end

  def update
    @bid.update(bid_params)

    
        respond_with do |format|
          if @bid.save
           format.html { redirect_to welcome_url, notice: 'Your bid has been placed' }
         else
           format.html { render action: 'new' }
           format.json { render json: @bid.errors, status: :unprocessable_entity }
         end
      end
  end

  def destroy
    @bid.destroy
    respond_with(@bid)
  end

  private
    def set_bid
      @bid = Bid.find(params[:id])
    end

    def bid_params
      params.require(:bid).permit(:provider_id, :post_id, :amount, :description)
    end
end
