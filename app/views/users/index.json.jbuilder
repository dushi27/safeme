json.array!(@users) do |user|
  json.extract! user, :id, :xid, :firstname, :lastname, :my_num, :e_num1, :e_num2, :token
  json.url user_url(user, format: :json)
end
