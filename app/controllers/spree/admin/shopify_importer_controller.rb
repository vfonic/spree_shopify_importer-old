module Spree
  module Admin
    class ShopifyImporterController < Spree::Admin::BaseController
      include SpreeShopifyImporter::ShopifyConcern

      helper 'spree/base'

      include Spree::Core::ControllerHelpers::Auth
      include Spree::Core::ControllerHelpers::Common
      include Spree::Core::ControllerHelpers::Store

      helper 'spree/admin/navigation'
      layout 'spree/layouts/admin'

      def index
        shopify_session
      end
    end
  end
end
