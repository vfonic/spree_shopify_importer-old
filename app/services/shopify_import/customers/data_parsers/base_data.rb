module ShopifyImport
  module Customers
    module DataParsers
      class BaseData
        def initialize(shopify_customer)
          @shopify_customer = shopify_customer
        end

        def customer_attributes
          {
            created_at: @shopify_customer.created_at,
            email: @shopify_customer.email,
            login: @shopify_customer.email
          }
        end
      end
    end
  end
end
