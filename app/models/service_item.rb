class ServiceItem < ApplicationRecord
  belongs_to :service
  has_many :order_items, dependent: :nullify
  accepts_nested_attributes_for :order_items
end
