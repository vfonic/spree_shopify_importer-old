require 'spec_helper'

RSpec.describe ShopifyImport::Customers::Create do
  subject { described_class.new(customer_data_feed) }

  before { ShopifyAPI::Base.site = 'https://foo:baz@test_shop.myshopify.com/admin' }

  describe '#call' do
    context 'with base customer data feed', vcr: { cassette_name: 'shopify/base_customer' } do
      let(:shopify_customer) { ShopifyAPI::Customer.find(4_654_675_207) }
      let(:customer_data_feed) do
        create(:shopify_data_feed,
               shopify_object_id: '4654675207', data_feed: shopify_customer.to_json)
      end

      it 'create spree user' do
        expect { subject.save! }.to change(Spree.user_class, :count).by(1)
      end

      it 'assigns shopify data feed to spree user' do
        subject.save!
        expect(customer_data_feed.reload.spree_object).to eq(Spree.user_class.find_by!(email: shopify_customer.email))
      end

      context 'customer attributes' do
        let(:spree_user) { Spree.user_class.find_by!(email: shopify_customer.email) }

        before { subject.save! }

        it 'email' do
          expect(spree_user.email).to eq(shopify_customer.email)
        end

        it 'created_at' do
          expect(spree_user.created_at).to eq(shopify_customer.created_at)
        end

        it 'generate_api_key'

        it 'skip_confirmation'
      end
    end
  end
end
