class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_one :feedback
end
