class Location < ApplicationRecord

  belongs_to :user

  enum type_location: ["type test", "type test2", "type test 3"]

end
