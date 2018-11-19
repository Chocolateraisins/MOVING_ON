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
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end

    # params[:service_items].each do |k, v|
    #   service_items = ServiceItem.find(k)
    #   service_items.content = v
    #   service_items.service = @service
    #   service_items.save
    # end
    # redirect_to service_service_item_path(@service)
  end

# create_table "service_items", force: :cascade do |t|
#     t.string "content"
#     t.bigint "service_id"
#     t.integer "unit_price"
#     t.string "data_type", default: "text"
#     t.string "category"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["service_id"], name: "index_service_items_on_service_id"
#   end


  def destroy
  end

  private

  def set_order
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description)
  end
end
