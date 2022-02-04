json.extract! reservation, :id, :user_id, :location_id, :price, :date_in, :date_out, :nb_people, :stripe_reference, :status, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
