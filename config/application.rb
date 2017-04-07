require_relative 'boot'
require 'rails/all'
#config.autoload_paths += %w(#{config.root}/app/models/ckeditor)
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blogapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)
  end
end
