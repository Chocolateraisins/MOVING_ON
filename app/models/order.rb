class Order < ApplicationRecord
  belongs_to :user
  has_many :inventories, dependent: :nullify
  has_many :order_items, dependent: :nullify

  validates :deceased_first_name, :deceased_last_name, :deceased_address, :date_of_death, presence: true

  geocoded_by :deceased_address
  after_validation :geocode, if: :will_save_change_to_deceased_address?

  def set_total_price
    self.invoice_amount = calculate_price_per(self.order_items)
    self.save
  end

  def calculate_price_per(collection)
  total = 0
   collection.each do |order_item|
      item = order_item.service_item
      if item.data_type == "number"
        total += order_item.content.to_i * item.unit_price.to_i
      elsif order_item.content == "yes"
        total += item.unit_price.to_i
      end
    end
    total
  end

  def price_per_service(service)
    collection = self.order_items.joins(:service_item).where('service_items.service_id = ?', service.id)
    calculate_price_per(collection)
  end
end


