json.array!(@users) do |user|
  json.extract! user, :name, :email, :password, :tweet_id
  json.url user_url(user, format: :json)
end