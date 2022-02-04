class Appliance < ApplicationRecord
  belongs_to :category
  has_many :location_appliances
  has_many :locations, through: :location_appliances
  accepts_nested_attributes_for :locations
end
