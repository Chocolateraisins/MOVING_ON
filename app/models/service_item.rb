class ServiceItem < ApplicationRecord
  belongs_to :service
  has_many :order_items, dependent: :nullify
  accepts_nested_attributes_for :order_items

  validates :content, :unit_price, :data_type, :category, presence: true
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
