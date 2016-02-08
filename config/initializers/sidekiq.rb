require 'sidekiq'
require 'sidekiq/web'

SIDEKIQ_REDIS_CONFIG = {
  host: ENV["REDIS_PORT_6379_TCP_ADDR"] || "localhost",
  port: ENV["REDIS_PORT_6379_TCP_PORT"] || "6379",
  db:   0,
  namespace: "book_exchange"
}

Sidekiq.configure_server do |config|
  config.redis = SIDEKIQ_REDIS_CONFIG
end

Sidekiq.configure_client do |config|
  config.redis = SIDEKIQ_REDIS_CONFIG
end

unless Rails.env.development?
  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    [user, password] == ["admin", "damnhomie"]
  end
end
