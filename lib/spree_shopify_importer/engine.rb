module SpreeShopifyImporter
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_shopify_importer'

    initializer 'spree.shopify_importer.environment', before: :load_config_initializers do |_app|
      Spree::ShopifyImporter::Config = Spree::ShopifyImporterConfiguration.new
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(__dir__, '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
