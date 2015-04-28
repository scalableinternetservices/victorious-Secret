class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @bids = Bid.all
    respond_with(@bids)
  end

  def show
    respond_with(@bid)
  end

  def new
    @bid = Bid.new
    session[:post_id] = params[:post_id]
    respond_with(@bid)
  end

  def edit
  end

  def create
    @bid = Bid.new(bid_params)
    post = Post.find(session[:post_id])
    @bid.post = post
    @bid.provider = current_user.provider
    respond_with do |format|
      if @bid.save
       format.html { redirect_to welcome_url, notice: 'Your bid has been placed' }
     else
       format.html { render action: 'new' }
       format.json { render json: @bid.errors, status: :unprocessable_entity }
     end
   end

  end

  def update
    @bid.update(bid_params)
    respond_with(@bid)
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
