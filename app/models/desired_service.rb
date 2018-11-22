class DesiredService < ApplicationRecord
  belongs_to :service
  belongs_to :order
  validates :service_id, uniqueness: { scope: :order_id }
end
