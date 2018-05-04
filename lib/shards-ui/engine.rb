require 'autoprefixer-rails'

module Shards
  module Rails
    class Engine < ::Rails::Engine
      initializer 'shards-ui.assets' do |app|
        %w(stylesheets javascripts).each do |sub|
          app.config.assets.paths << root.join('assets', sub).to_s
        end
      end
    end
  end
end