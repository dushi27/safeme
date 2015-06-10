json.array!(@jawbones) do |jawbone|
  json.extract! jawbone, :id, :user_xid, :type, :action
  json.url jawbone_url(jawbone, format: :json)
end
