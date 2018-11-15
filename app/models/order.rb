class Order < ApplicationRecord
  belongs_to :user
  has_many :inventories
  has_many :service_item_orders, dependent: :nullify
end
