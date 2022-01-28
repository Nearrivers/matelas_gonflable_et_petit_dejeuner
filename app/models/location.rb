class Location < ApplicationRecord

  belongs_to :user
  has_many :user_fav

  enum type_location: ["type test", "type test2", "type test 3"]

  def address
    [street, city, zip_code].compact.join(', ')
  end

  geocoded_by :address  # Je dis à Geocoder quel est le champ adresse de mon modèle
  after_validation :geocode, if: :street_changed?   # auto-fetch coordinates
end
