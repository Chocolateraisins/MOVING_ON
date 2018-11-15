class Service < ApplicationRecord
  has_many :service_items, dependent: :nullify
end
