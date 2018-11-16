class OrderItemsController < ApplicationController

  def index
    @order = Order.find(params[:order_id])
  end

  def show
    @order = Order.find(params[:order_id])
  end

  def edit
  end

end
