json.extract! user_fav, :id, :user_id, :location_id, :created_at, :updated_at
json.url user_fav_url(user_fav, format: :json)
