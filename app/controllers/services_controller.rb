class ServicesController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
  end

  def index
    @services = Service.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_order
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name)
  end
end
