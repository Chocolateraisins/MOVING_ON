class Service < ApplicationRecord
  has_many :service_items, dependent: :nullify
  accepts_nested_attributes_for :service_items
  validates :name, :description, presence: true
  has_many :desired_services, dependent: :destroy
end
