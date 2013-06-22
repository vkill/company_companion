if Dir[File.join(File.dirname(__FILE__), '{production,staging}')].empty?
  source 'http://ruby.taobao.org'
else
  source 'https://rubygems.org'
end

gem 'rails', '4.0.0.rc2'

gem 'mysql2'

gem 'sass-rails', '~> 4.0.0.rc2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
# gem 'therubyracer', platforms: :ruby


gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass'
gem 'handlebars_assets'
gem 'rivets-rails'
gem "i18n-js", "~> 3.0.0.rc5"
gem "js-routes", "~> 0.9.0"
gem "json2-rails"


gem 'devise', "~> 3.0.0.rc"
gem 'devise-i18n'

gem 'rails-i18n'
gem 'seedbank', github: 'vkill/seedbank', ref: '48e8f9375d68b89f0d0476bd8065be014e311225'

gem "slim-rails"
gem 'jbuilder', '~> 1.2'

gem 'kaminari'
gem "simple_form", "~> 3.0.0.rc"
gem 'client_side_validations', github: 'bcardarella/client_side_validations', branch: '4-0-beta'
gem 'client_side_validations-simple_form', path: 'vendor/gems/client_side_validations-simple_form'


gem 'carrierwave'
gem 'ancestry'
gem 'active_hash'
gem 'default_value_for'
gem "attribute_enums", require: "attribute_enums/active_record"
gem 'activevalidators'

gem 'rack-cors', require: 'rack/cors'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'thin', require: false
  gem 'quiet_assets'
  gem 'coffee-rails-source-maps'
end

group :test do
  gem 'rspec-rails', require: false
end

group :development, :test do
  gem 'factory_girl_rails', require: false
  gem 'ffaker', require: false
  gem 'database_cleaner', require: false
  gem 'pry-rails'
end
