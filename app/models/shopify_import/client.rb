require 'singleton'

module ShopifyImport
  class Client
    include Singleton
    attr_reader :site

    def get_connection(api_key: nil, password: nil, shop_domain: nil, token: nil)
      @api_key = api_key || Spree::Config[:shopify_api_key]
      @password = password || Spree::Config[:shopify_password]
      @shop_domain = shop_domain || Spree::Config[:shopify_shop_domain]
      @token = token || Spree::Config[:shopify_token]

      if password.present?
        @site = shopify_site
      elsif token.present?
        ShopifyAPI::Session.new(@shop_domain, @token)
      else
        raise 'You must provide api_key together with password or authentication token'
      end
    end

    private

    # TODO: ADD ERROR HANDLING TO EMPTY CREDENTIALS
    # TODO: ADD ERROR HANDLING TO INVALID CREDENTIALS
    def shopify_site
      ShopifyAPI::Base.site = "https://#{@api_key}:#{@password}@#{@shop_domain}.myshopify.com/admin"
    end
  end
end
