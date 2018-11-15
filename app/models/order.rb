class Order < ApplicationRecord
  belongs_to :user
  has_many :inventories, :service_item_orders, dependent: :nillify
end
