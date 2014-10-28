json.array!(@users) do |user|
  json.extract! user, :id, :login, :email
  json.url user_url(user, format: :json)
end
