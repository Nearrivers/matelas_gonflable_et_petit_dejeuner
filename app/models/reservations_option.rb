class ReservationsOption < ApplicationRecord
  belongs_to :reservation
  belongs_to :option
end
