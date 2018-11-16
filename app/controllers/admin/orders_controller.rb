class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.where.not(latitude: nil, longitude: nil)
      @markers = @orders.map do |order|
        { lat: order.latitude,
          lng: order.longitude
        }
      end
  end
end
