class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @orders.each do |order|
      result = Geocoder.search(order.deceased_address)
      order.latitude = result[0]
      order.longitude = result[1]
    end

    @valid_orders = Order.where.not(latitude: nil, longitude: nil)
    @markers = @valid_orders.map do |valid_order|
      { lat: valid_order.latitude,
        lng: valid_order.longitude
      }
    end

    @active = 'orders-tab'

    if params[:service] && params[:status]
      service_id = params[:service].to_i
      completed = params[:status] == "Completed"
      @active = 'tasks-tab'
      @order_items = OrderItem.joins(:service_item).where("service_items.service_id = ? AND service_items.category = 'task' AND order_items.completed = ?", service_id, completed)
    else
      @order_items = OrderItem.joins(:service_item).where("service_items.category = 'task'")
    end

  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to admin_orders_path
  end

end
