module Spree
  class ShopifyImporterConfiguration < Preferences::Configuration
    preference :shopify_domain, :string
    preference :shopify_token, :string
  end
end
