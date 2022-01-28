class Location < ApplicationRecord

  belongs_to :user
  has_many :user_fav

  enum type_location: ["type test", "type test2", "type test 3"]

end
