class LocationAppliance < ApplicationRecord
  belongs_to :location
  belongs_to :appliance
end
