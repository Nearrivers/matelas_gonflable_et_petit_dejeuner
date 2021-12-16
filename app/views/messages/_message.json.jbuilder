json.extract! message, :id, :content, :user, :conversation, :created_at, :updated_at
json.url message_url(message, format: :json)
