class ServiceItem < ApplicationRecord
  belongs_to :service
  has_many :service_item_orders, dependent: :nillify
end
