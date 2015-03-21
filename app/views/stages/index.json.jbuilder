json.array!(@stages) do |stage|
  json.extract! stage, :id, :stage
  json.url stage_url(stage, format: :json)
end
