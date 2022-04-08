Resque.redis = Redis.new(password: ENV['REDIS_PASS']) if Rails.env == 'production'
