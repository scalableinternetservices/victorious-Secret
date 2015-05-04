class ApplicationController < ActionController::Base


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :get_notifications
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :age, :phone, :address]
    devise_parameter_sanitizer.for(:account_update) << [:name, :age, :phone, :address]
  end

  

  def after_sign_out_path_for(resource_or_scope)
  		request.referrer
  end

  def after_sign_in_path_for(resource_or_scope)
    welcome_url
  end

  def get_notifications
    if user_signed_in?
        @count = 0

        @won = 0
        Notification.all.each do |n|
          unless n.bid.nil?
            if n.bid.post.consumer == current_user.consumer
              @count = @count + 1
            end

          end

          unless n.post.nil?
            if n.post.provider == current_user.provider
              @won = @won+1
            end
          end


        end
    end
  end




end
