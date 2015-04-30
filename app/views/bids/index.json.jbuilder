json.array!(@bids) do |bid|
  json.extract! bid, :id, :provider_id, :post_id, :amount, :description
  json.url bid_url(bid, format: :json)
end
