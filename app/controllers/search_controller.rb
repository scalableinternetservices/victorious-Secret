class SearchController < ApplicationController
  respond_to :html,:js
  def posts
    # @term = "Praveen"
    # @search = User.find_with_ferret("(#{@term})^2 OR (#{@term.split.map {|t| t + "*" }.join(' ')})", {:limit => 100})
    # count = User.find_with_ferret("(#{@term})^2 OR (#{@term.split.map {|t| t + "*" }.join(' ')})", {:lazy => true, :limit => 100}).total_hits
    # Rails.logger.debug("My object: #{@search.inspect}")
    # Rails.logger.debug("My object: #{count.ins  pect}")
    @results = []
    if params[:query]!=nil
      search= User.search do
        keywords params[:query]
      end
      @results = search.results
    end
  end

  def search
    @results = []
    @search_posts = []
    @search_users = []
    if params[:query]!=nil
      search= User.search do
        keywords params[:query]
      end
      @results = search.results
      @search_users = @results
      if params[:radius].nil?
        params[:radius]=25; # default radius is assumed to be 25
      end
      search = Post.search do
        keywords params[:query]
          if !params[:lat].nil? && !params[:lon].nil?
             with(:location).in_radius(params[:lat], params[:lon], params[:radius])
          end
        order_by(:updated_at, :desc)
      end
      @search_posts=search.results
      Rails.logger.debug("My object: #{@search_users.inspect}")
      Rails.logger.debug("My object: #{@search_posts.inspect}")
    end
  end
end
