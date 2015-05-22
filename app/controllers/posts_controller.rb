class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    @show_accept = false
    if current_user.consumer == @post.consumer
      @show_accept = true
    end
    
    Notification.all.each do |n|
      if(request.referer == consumer_welcome_url)
        unless n.bid.nil?
          if ( (n.bid.post == @post) && (current_user.consumer == @post.consumer) )
              n.destroy
          end

        end

      end

      if(request.referer == provider_welcome_url)
        unless n.post.nil?
          if ( n.post == @post ) && ( current_user.provider == @post.provider)
            n.destroy
          end
        end
      end
    end
    respond_with(@post,@show_accept)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
    unless @post.provider.nil?
      redirect_to request.referer,alert: "you have accepted a provider for this already. Can' edit the post now"
    end
    @edit = true

  end

  def create
    @post = Post.new(post_params)
    @post.consumer = current_user.consumer

    begin
    params[:categories].each do
      |x|
      @post.categories << x
    end

    rescue
      @post.categories<<'general'
    end

    @post.address = params[:address]
    @post.lat = params[:lat].to_f
    @post.lon = params[:lon].to_f

    
    
    respond_with do |format|
      if @post.save
        format.html { redirect_to welcome_path, notice: 'Your post was successfull posted' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
    begin
      categories = []
      params[:categories].each do |x|
        categories << x
      end
      @post.categories = categories
      if(params.has_key?(:address))
      	@post.address = params[:address]
      end

      @post.update(post_params)
    rescue
    	if(params.has_key?(:address))
      	@post.address = params[:address]
      end
      @post.update(post_params)
    end
    
    redirect_to welcome_url,notice: 'your post has been updated'
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :picture, :price,:categories,:address,:lat, :lon)
    end

    

end
