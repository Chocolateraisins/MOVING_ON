class ServiceItem < ApplicationRecord
  belongs_to :service
  has_many :service_item_orders, dependent: :nullify
  accepts_nested_attributes_for :service_item_orders
end
