class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @valid_orders = Order.where.not(latitude: nil, longitude: nil)
      @markers = @valid_orders.map do |order|
        { lat: order.deceased_address.latitude,
          lng: order.longitude_address.longitude
        }
      end
  end
end
