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

# shop = Shop.first
# session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
# ShopifyAPI::Base.activate_session(session)
# ShopifyAPI::Product.all
# This one might be needed to prevent loading whatever shopify loads when there's an active session
# ShopifyAPI::Base.clear_session
