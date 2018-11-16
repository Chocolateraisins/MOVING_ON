class Order < ApplicationRecord
  belongs_to :user
  has_many :inventories
  has_many :order_items, dependent: :nullify
end
