json.array!(@conreviews) do |conreview|
  json.extract! conreview, :id, :rating, :description, :provider_id, :post_id
  json.url conreview_url(conreview, format: :json)
end
