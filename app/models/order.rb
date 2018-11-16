class Order < ApplicationRecord
  belongs_to :user
  has_many :inventories
  has_many :order_items, dependent: :nullify

  geocoded_by :deceased_address
  after_validation :geocode, if: :will_save_change_to_deceased_address?
end
