json.array!(@providers) do |provider|
  json.extract! provider, :id, :user_id, :rating
  json.url provider_url(provider, format: :json)
end
