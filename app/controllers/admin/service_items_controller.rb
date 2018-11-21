class Admin::ServiceItemsController < ApplicationController
  before_action :set_service_item, only: [:show, :edit, :update, :destroy]
  def new
    @service = Service.find(params[:service_id])
    @service_item = ServiceItem.new
  end

  def create
    @service = Service.find(params[:service_id])
    @service_item = ServiceItem.new(service_items_params)
    @service_item.service = @service

      if @service_item.save
        redirect_to admin_service_service_item_path(@service, @service_item)

      else
        render :new
      end
  end

  def show
    @service = @service_item.service
  end

  def edit
    @service = @service_item.service
  end

  def update
     if @service_item.update(service_items_params)
        redirect_to admin_service_service_item_path(@service_item)

      else
        render :new
      end
  end

  def destroy
    @service_item.destroy

    respond_to do |format|
      format.html { redirect_to admin_services_path, notice: "Service Item #{@service_item.content.upcase} was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def set_service_item
    @service_item = ServiceItem.find(params[:id])
  end

  def service_items_params
    params.require(:service_item).permit(:content, :unit_price, :data_type, :category, :additional_information, :type)
  end
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
