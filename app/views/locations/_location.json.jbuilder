json.extract! location, :id, :name, :nbRoom, :nbBed, :type, :description, :city, :street, :zipcode, :lat, :long, :price, :avgScore, :equipments_id, :locationOptions_id, :reservation_id, :feedbacks_id, :created_at, :updated_at
json.url location_url(location, format: :json)
