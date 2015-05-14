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
      Rails.logger.debug("My object: #{@results.inspect}")
      Rails.logger.debug("My object: #{search.total.inspect}")
    end
  end

  def search
    @results = []
    @search_posts = []
    @search_users = []
    if params[:query]!=nil
      search= Sunspot.search User, Post do |query|
        query.keywords params[:query]
      end
      @results = search.results
      @results.each do |result|
        if result.class.to_s=="Post"
          @search_posts<<result
        else
          @search_users<<result
        end
        Rails.logger.debug("My object: #{result.class}")
      end
      Rails.logger.debug("My object: #{@search_users.inspect}")
      Rails.logger.debug("My object: #{@search_posts.inspect}")
      Rails.logger.debug("My object: #{search.total.inspect}")
    end
  end
end
