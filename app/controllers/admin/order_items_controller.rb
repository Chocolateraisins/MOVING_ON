class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_items_params)
    redirect_to admin_orders_path(active_tab: 'tasks')
  end

  private

  def order_items_params
    params.require(:order_item).permit(:completed)
  end


end
