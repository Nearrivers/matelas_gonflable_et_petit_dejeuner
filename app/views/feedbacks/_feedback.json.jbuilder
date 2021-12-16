json.extract! feedback, :id, :user, :location, :score, :comment, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
