class Order < ApplicationRecord
  belongs_to :user
  has_many :inventories
  has_many :order_items, dependent: :nullify

  validates :deceased_first_name, :deceased_last_name, :deceased_address, :date_of_death, presence: true

  geocoded_by :deceased_address
  after_validation :geocode, if: :will_save_change_to_deceased_address?
end
