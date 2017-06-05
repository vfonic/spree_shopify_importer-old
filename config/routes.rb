Spree::Core::Engine.add_routes do
  namespace :admin, path: Spree.admin_path do
    get 'shopify-importer' => 'shopify_importer#index', as: :shopify_importer
    get 'shopify-importer/new' => 'shopify_importer#new', as: :new_shopify_importer_session
  end

  # TODO: secure this mounting so customers can't connect to their store and import products from their store, possibly
  # breaking the whole store
  # mount ShopifyApp::Engine, at: "#{Spree.admin_path}/shopify-importer"
end
