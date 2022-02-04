class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_one :feedback
  has_many :reservations_options
  has_many :options, through: :reservations_options
end
