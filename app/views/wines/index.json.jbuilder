json.array!(@wines) do |wine|
  json.extract! wine, :id, :vineyard_id, :appellation_id, :varietal_id, :name, :label_url, :api_url, :pricemin, :pricemax, :attributes, :sku, :api_provider, :api_id
  json.url wine_url(wine, format: :json)
end
