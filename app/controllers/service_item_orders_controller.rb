class ServiceItemOrdersController < ApplicationController

  def index
    @order = Order.find(params[:order_id])
  end

  def show
  end

  def edit
  end

end
