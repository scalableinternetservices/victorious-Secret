class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    @show_accept = false
    if current_user.consumer == @post.consumer
      @show_accept = true
    end

    

    if(request.referer == consumer_welcome_url)
      Notification.all.each do |n|
        unless n.bid.nil?
          if ( (n.bid.post == @post) && (current_user.consumer == @post.consumer) )
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
  end

  def create
    @post = Post.new(post_params)
    @post.consumer = current_user.consumer
    params[:categories].each do
      |x|
      @post.categories << x
    end
    
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
    @post.update(post_params)
    params[:categories].each do |x|
      @post.categories << x
    end
    
    respond_with(@post)
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
      params.require(:post).permit(:title, :description, :picture, :price,:categories)
    end

    

end
