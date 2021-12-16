json.extract! reservation, :id, :location, :user, :date_in, :date_out, :nbPeople, :strip_reference, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
