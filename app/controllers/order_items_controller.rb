class OrderItemsController < ApplicationController

  def index
    @order = Order.find(params[:order_id])
    @order_items = Order_items.all
  end

  def show
    @order = Order.find(params[:order_id])
  end

  def edit
  end



end
