RSpec.describe 'Shopify Importer', type: :feature do
  context 'as admin user' do
    stub_authorization!

    scenario 'admin sees shopify importer link' do
      visit '/admin'

      within('[data-hook="admin_configurations_sidebar_menu"]') do
        expect(page).to have_selector(%([href="#{spree.admin_shopify_importer_path}"]))
      end
    end

    scenario 'admin connects with the shopify store' do
      visit spree.admin_shopify_importer_path

      fill_in placeholder: 'example.myshopify.com', with: 'split-themes.myshopify.com'
      click_button('Connect')
    end
  end
end

# custom_authorization! do |user|
#   # allow dispatch to :admin, :index, and :edit on Spree::Order
#   can [:admin, :edit, :index, :read], Spree::Order
#   # allow dispatch to :index, :show, :create and :update shipments on the admin
#   can [:admin, :manage, :read, :ship], Spree::Shipment
# end
