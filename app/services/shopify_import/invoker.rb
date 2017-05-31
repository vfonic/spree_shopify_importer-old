module ShopifyImport
  class Invoker
    def import!(credentials:)
      connect(credentials)

      initiate_import!
    end

    private

    def connect(credentials)
      ShopifyImport::Client.instance.get_connection(credentials)
    end

    def initiate_import!
      ShopifyImport::ProductsImporter.import!
    end
  end
end
