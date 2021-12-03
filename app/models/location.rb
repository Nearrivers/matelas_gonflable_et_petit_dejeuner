class Location < ApplicationRecord
  has_many :equipments
  has_and_belongs_to_many :l_options
  has_and_belongs_to_many :reservation
  has_and_belongs_to_many :feedbacks
end
