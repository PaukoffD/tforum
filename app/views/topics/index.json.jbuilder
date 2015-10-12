json.array!(@topics) do |topic|
  json.extract! topic, :id, :subject
  json.url topic_url(topic, format: :json)
end
