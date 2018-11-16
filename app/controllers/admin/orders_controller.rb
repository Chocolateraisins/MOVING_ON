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
  end
end
