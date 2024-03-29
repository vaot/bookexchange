require File.expand_path('../boot', __FILE__)

require 'rails/all'

# https://github.com/netzpirat/haml_coffee_assets/issues/128#issuecomment-99666823
require 'action_view'
require 'action_view/template/resolver'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookexchange
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths << Rails.root.join('lib')
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.paperclip_defaults = {
      storage: :s3,
      s3_credentials: {
        bucket: 'bookexchange',
        url: ":s3_path_url"
      },
      s3_protocol: "https"
    }
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
