class WelcomeController < ApplicationController
  def index

  	@posts = current_user.consumer.posts
  end
end
	