class SearchController < ApplicationController
  respond_to :html
  def posts
    # @term = "Praveen"
    # @search = User.find_with_ferret("(#{@term})^2 OR (#{@term.split.map {|t| t + "*" }.join(' ')})", {:limit => 100})
    # count = User.find_with_ferret("(#{@term})^2 OR (#{@term.split.map {|t| t + "*" }.join(' ')})", {:lazy => true, :limit => 100}).total_hits
    # Rails.logger.debug("My object: #{@search.inspect}")
    # Rails.logger.debug("My object: #{count.ins  pect}")
    search= User.search do
      keywords params[:query]
    end
    @results = search.results
    Rails.logger.debug("My object: #{@results.inspect}")
    Rails.logger.debug("My object: #{search.total.inspect}")
  end

  def producer_search

  end
end
