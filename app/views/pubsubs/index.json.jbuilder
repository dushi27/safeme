json.array!(@pubsubs) do |pubsub|
  json.extract! pubsub, :id, :user_xid, :type, :action, :timestamp
  json.url pubsub_url(pubsub, format: :json)
end
