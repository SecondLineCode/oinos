json.array!(@wine_types) do |wine_type|
  json.extract! wine_type, :id, :api_id, :wine_type
  json.url wine_type_url(wine_type, format: :json)
end
