class OrdersController < ApplicationController

  def new
    unless current_user
      redirect_to new_user_session_path
      flash[:notice] = "Please log in to proceed"
      end
      @user = User.find(params[:user_id])
      @order = Order.new
  end

  def show
  end

  def edit
  end

  def index
  end

  private

  def order_params
  end

end
