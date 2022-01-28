class Location < ApplicationRecord

  belongs_to :user

  enum type_location: ["type test", "type test2", "type test 3"]

  geocoded_by :street         # Je dis à Geocoder quel est le champ adresse de mon modèle
  after_validation :geocode, if: :street_changed?   # auto-fetch coordinates
end
