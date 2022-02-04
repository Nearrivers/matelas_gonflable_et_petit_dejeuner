json.extract! location, :id, :name, :nb_room, :nb_bed, :type_location, :description, :city, :street, :zip_code, :latitude, :longitude, :price, :avg_score, :created_at, :updated_at
json.url location_url(location, format: :json)
