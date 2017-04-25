module Spree
  module ShopifyImporter
    class SessionStorage
      def self.store(session)
        Spree::ShopifyImporter::Config.shopify_domain = session.url
        Spree::ShopifyImporter::Config.shopify_token = session.token
      end

      def self.retrieve(_id = nil)
        ShopifyAPI::Session.new(
          Spree::ShopifyImporter::Config.shopify_domain,
          Spree::ShopifyImporter::Config.shopify_token
        )
      end
    end
  end
end
