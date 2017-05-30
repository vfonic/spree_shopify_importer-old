module ShopifyImport
  module Importers
    class CustomersImporter < BaseImporter
      private

      def resources
        ShopifyImport::Customer.new(credentials: @credentials).find_all(@params)
      end

      def creator
        ShopifyImport::Customers::Create
      end
    end
  end
end
