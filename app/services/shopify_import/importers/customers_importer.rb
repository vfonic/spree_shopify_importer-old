module ShopifyImport
  module Importers
    class CustomersImporter < BaseImporter
      private

      def resources
        ShopifyImport::Customer.all
      end

      def creator
        ShopifyImport::Customers::Create
      end
    end
  end
end
