json.array!(@my_threads) do |my_thread|
  json.extract! my_thread, :name, :category_id, :tweet_id
  json.url my_thread_url(my_thread, format: :json)
end