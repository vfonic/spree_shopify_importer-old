Deface::Override.new(
  virtual_path: 'spree/admin/shared/sub_menu/_configuration',
  name: 'add_shopify_importer_to_admin_sidebar',
  insert_bottom: '[data-hook="admin_configurations_sidebar_menu"]',
  text: "
    <%= configurations_sidebar_menu_item(
          Spree.t(:shopify_importer),
          spree.admin_shopify_importer_path
        ) if can? :manage, Spree::ShopifyImporter %>
  ",
  original: '41c9125ad4022e7dac858458620c2a141e4f49d0'
)
