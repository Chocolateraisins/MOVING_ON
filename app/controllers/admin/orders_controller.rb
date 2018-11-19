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
      service = params[:service]
      completed = params[:status] == "Completed"
      @active = 'tasks-tab'
      ### maybe change ServiceItem to OrderItem
      @order_items = ServiceItem.joins(:service).joins(:order_items).where('services.name = ? AND service_items.category = ? AND order_items.completed = ?', service, "task", completed)
    else
      @order_items = OrderItem.all
    end

  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to admin_orders_path
  end

end
