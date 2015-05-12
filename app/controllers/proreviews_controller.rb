class ProreviewsController < ApplicationController
  before_action :set_proreview, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:new, :create]

  respond_to :html

  def index
    @proreviews = Proreview.all
    respond_with(@proreviews)
  end

  def show
    respond_with(@proreview)
  end

  def new
    @proreview = Proreview.new
    
    respond_with(@proreview)
  end

  def edit
  end

  def create
    @proreview = Proreview.new(proreview_params)
    
    @proreview.consumer = current_user.consumer
    @proreview.post = @post

    if @proreview.save
        cur_rating = @post.provider.rating
        count = @post.provider.count + 1
        new_rating = ( (cur_rating*@post.provider.count) + @proreview.rating.to_f).fdiv(count)
        @post.provider.rating = new_rating
        @post.provider.count = count
        @post.save()
        @post.provider.save()
    end
    
    respond_with do |format|
      if @proreview.save
        format.html {redirect_to welcome_url, notice: 'your review has been duely noted'}
      else
        format.html {render action: 'new'}
      end
    end

  end

  def update
    @proreview.update(proreview_params)
    respond_with(@proreview)
  end

  def destroy

    @proreview.destroy
    respond_with(@proreview)
  end

  private
    def set_proreview
      @proreview = Proreview.find(params[:id])
    end

    def proreview_params
      params.require(:proreview).permit(:rating, :description, :consumer_id, :post_id)
    end

    def set_post
      @post = Post.find(params[:post_id])
      session[:post_id] = params[:post_id]
    rescue
      @post = Post.find(session[:post_id])
    end

end
