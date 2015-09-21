module Bookexchange
  extend self

  def redis=(config)
    return unless config.present?
    @redis = Redis::Namespace.new(:book_exchange, redis: Redis.new(config))
  end

  def redis
    return @redis if @redis.present?
    @redis = Redis::Namespace.new(:book_exchange, redis: Redis.new(host: "localhost", port: 6379, db: 0))
  end

end

redis_config = YAML.load_file(Rails.root.join('config/redis.yml').to_s)
Bookexchange.redis = redis_config[Rails.env]
