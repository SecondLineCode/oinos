json.array!(@appellations) do |appellation|
  json.extract! appellation, :id, :app_name, :app_region, :app_area
  json.url appellation_url(appellation, format: :json)
end
