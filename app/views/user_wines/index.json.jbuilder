json.array!(@user_wines) do |user_wine|
  json.extract! user_wine, :id, :user_id, :wine_id, :stage_id, :rating, :review
  json.url user_wine_url(user_wine, format: :json)
end
