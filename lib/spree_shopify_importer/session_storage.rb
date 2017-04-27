module Spree
  module ShopifyImporter
    class SessionStorage
      def self.store(session)
        Spree::ShopifyImporter::Config.shopify_domain = session.url
        Spree::ShopifyImporter::Config.shopify_token = session.token
      end

      def self.retrieve(_id = nil)
        domain = Spree::ShopifyImporter::Config.shopify_domain
        token = Spree::ShopifyImporter::Config.shopify_token

        return if domain.blank? || token.blank?

        ShopifyAPI::Session.new(domain, token)
      end
    end
  end
end
