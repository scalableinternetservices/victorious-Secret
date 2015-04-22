json.array!(@consumers) do |consumer|
  json.extract! consumer, :id, :user_id, :name, :age, :phone, :address
  json.url consumer_url(consumer, format: :json)
end
