json.array!(@searches) do |search|
  json.extract! search, :id, :name, :folder
  json.url search_url(search, format: :json)
end
