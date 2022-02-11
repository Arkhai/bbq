if Rails.env == 'production'
  Resque.redis = Redis.new(:password => ENV["REDIS_PASS"])
end