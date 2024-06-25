# config/application.rb
require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ProdutosefornecedoresApi
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_paths += %W[#{config.root}/app]
    config.api_only = true
  end
end
