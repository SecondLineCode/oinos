json.array!(@varietals) do |varietal|
  json.extract! varietal, :id, :api_id, :varietal, :varietal_type
  json.url varietal_url(varietal, format: :json)
end
