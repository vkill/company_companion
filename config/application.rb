require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module CompanyCompanion
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths += %W(
      #{config.root}/app/models/serializations
    )

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Beijing'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.default_locale = :'zh-CN'
    config.i18n.fallbacks = true

    # gem rails-i18n
    config.i18n.available_locales = [:en, :'zh-CN']

    # gem rack-cors
    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

    # gem factory_girl
    config.generators do |g|
      g.fixture_replacement :factory_girl
      g.factory_girl dir: 'spec/factories'
    end
    
    # gem rspec-rails
    config.generators do |g|
      g.template_engine :erb
      g.test_framework  :rspec
      g.integration_tool :rspec
    end

    # gem bootstrap-sass
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
