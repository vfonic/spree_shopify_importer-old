ShopifyApp.configure do |config|
  config.application_name = 'Spree Shopify Importer'
  # users checkouts
  ALL = %w[
    content themes products customers orders draft_orders script_tags
    fulfillments shipping analytics
  ].freeze
  config.scope = ALL.map { |resource| "read_#{resource}" }.join(', ')
  config.embedded_app = true
end

ShopifyApp::SessionRepository.storage = Spree::ShopifyImporter::SessionStorage
