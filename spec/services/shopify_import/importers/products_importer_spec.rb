require 'spec_helper'

RSpec.describe ShopifyImport::Importers::ProductsImporter, type: :service do
  describe '#import!', vcr: { cassette_name: 'shopify_import/products_importer/import' } do
    before { authenticate_with_shopify }

    it 'creates shopify data feeds' do
      importer = ShopifyImport::Importers::ProductsImporter.new

      expect { importer.import! }.to change(Shopify::DataFeed, :count).by(2)
    end

    it 'creates spree products' do
      importer = ShopifyImport::Importers::ProductsImporter.new

      expect { importer.import! }.to change(Spree::Product, :count).by(2)
    end
  end
end
