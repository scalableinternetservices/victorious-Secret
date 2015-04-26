class ApplicationController < ActionController::Base


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_categories

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :age, :phone, :address]
    devise_parameter_sanitizer.for(:account_update) << [:name, :age, :phone, :address]
  end

  

  def after_sign_out_path_for(resource_or_scope)
  		request.referrer
  end

  def set_categories
    @categories = ['automobile', 'beauty', 'computer', 'creative', 'event', 'household', 'financial', 'labor', 'legal', 'tutoring', 'pet', 'therapeutic', 'travel']
    @categories.sort!
  end


end
