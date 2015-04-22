json.array!(@consumers) do |consumer|
  json.extract! consumer, :id, :user_id, :rating
  json.url consumer_url(consumer, format: :json)
end
