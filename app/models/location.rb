class Location < ApplicationRecord

  belongs_to :user
  has_many :user_fav, :dependent => :destroy
  has_many :reservations, :dependent => :destroy
  has_many :location_appliances
  has_many :appliances, through: :location_appliances

  enum type_location: ["type test", "type test2", "type test 3"]

  # Permet de dire à Geocoder que le champ adresse en fait les champs street, city et zip_code combinés
  # et séparés par une virgule
  def address
    [street, city, zip_code].compact.join(', ')
  end

  geocoded_by :address # Je dis à Geocoder quel est le champ adresse de mon modèle
  after_validation :geocode, if: :street_changed? # auto-fetch coordinates
end
