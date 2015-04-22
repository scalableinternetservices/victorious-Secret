class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @providers = Provider.all
    respond_with(@providers)
  end

  def show
    respond_with(@provider)
  end

  def new
    @provider = Provider.new
    respond_with(@provider)
  end

  def edit
  end

  def create
    @provider = Provider.new(provider_params)
    @provider.save
    respond_with(@provider)
  end

  def update
    @provider.update(provider_params)
    respond_with(@provider)
  end

  def destroy
    @provider.destroy
    respond_with(@provider)
  end

  private
    def set_provider
      @provider = Provider.find(params[:id])
    end

    def provider_params
      params.require(:provider).permit(:user_id, :name, :age, :phone, :address)
    end
end
