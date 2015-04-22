class ConsumersController < ApplicationController
  include CheckIfConsumer
  before_action :set_consumer, only: [:show, :edit, :update, :destroy]
  
  respond_to :html

  def index
    @consumers = Consumer.all
    respond_with(@consumers)
  end

  def show
    respond_with(@consumer)
  end

  def new
    @consumer = Consumer.new
    respond_with(@consumer)
  end

  def edit
  end

  def create
    @consumer = Consumer.new(consumer_params)
    @consumer.save
    respond_with(@consumer)
  end

  def update
    @consumer.update(consumer_params)
    respond_with(@consumer)
  end

  def destroy
    @consumer.destroy
    respond_with(@consumer)
  end

  private
    def set_consumer
      @consumer = Consumer.find(params[:id])
    end

    def consumer_params
      params.require(:consumer).permit(:user_id, :rating)
    end
end
