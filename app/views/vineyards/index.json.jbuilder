json.array!(@vineyards) do |vineyard|
  json.extract! vineyard, :id, :vineyard_name
  json.url vineyard_url(vineyard, format: :json)
end
