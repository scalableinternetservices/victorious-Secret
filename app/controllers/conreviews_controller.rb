class ConreviewsController < ApplicationController
  before_action :set_conreview, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:new, :create]

  respond_to :html

  def index
    @conreviews = Conreview.all
    respond_with(@conreviews)
  end

  def show
    respond_with(@conreview)
  end

  def new
    @conreview = Conreview.new
    respond_with(@conreview)
  end

  def edit
  end

  def create
    @conreview = Conreview.new(conreview_params)
    
    @conreview.provider = current_user.provider
    @conreview.post = @post

    if @conreview.save
        cur_rating = @post.consumer.rating
        count = @post.consumer.count + 1
        new_rating = ( (cur_rating*@post.consumer.count) + @conreview.rating.to_f).fdiv(count)
        @post.consumer.rating = new_rating
        @post.consumer.count = count
        @post.save()
        @post.consumer.save()
    end
    
    respond_with do |format|
      if @conreview.save
        format.html {redirect_to welcome_url, notice: 'your review has been duely noted'}
      else
        format.html {render action: 'new'}
      end
    end
    
  end

  def update
    @conreview.update(conreview_params)
    respond_with(@conreview)
  end

  def destroy
    @conreview.destroy
    respond_with(@conreview)
  end

  private
    def set_conreview
      @conreview = Conreview.find(params[:id])
    end

    def conreview_params
      params.require(:conreview).permit(:rating, :description, :provider_id, :post_id)
    end

    def set_post
      @post = Post.find(params[:post_id])
      session[:post_id] = params[:post_id]
    rescue
      @post = Post.find(session[:post_id])
    end

end
