module WithBids
  extend ActiveSupport::Concern

  module InstanceMethods
    def generate_bid_key
      Rails.cache.fetch("user_bid_key:#{id}") { SecureRandom.hex(6) }
    end
  end

  def self.included(base)
    base.send :include, InstanceMethods
  end
end
