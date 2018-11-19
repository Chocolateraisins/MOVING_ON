class OrdersController < ApplicationController

  def index
      @orders = current_user.orders
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.user == nil
      redirect to root_path
      flash[:notice] = "Please log in to create a new order."
    elsif
      @order.save
      redirect_to order_order_items_path(@order)
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    params[:order_items].each do |k, v|
      order_item = OrderItem.find(k)
      order_item.content = v
      order_item.order = @order
      order_item.save
    end
    redirect_to orders_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status, :invoice_amount, :deceased_first_name, :deceased_last_name, :deceased_address, :date_of_death)
  end

end


