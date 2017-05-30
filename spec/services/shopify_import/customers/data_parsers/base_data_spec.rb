require 'spec_helper'

RSpec.describe ShopifyImport::Customers::DataParsers::BaseData do
  subject { described_class.new(shopify_customer) }
  let(:shopify_customer) { create(:shopify_customer) }

  describe '#customer_attributes' do
    context 'with sample customer' do
      let(:customer_attributes) do
        {
          created_at: shopify_customer.created_at,
          email: shopify_customer.email,
          login: shopify_customer.email
        }
      end

      it 'prepares hash of attributes' do
        expect(subject.customer_attributes).to eq(customer_attributes)
      end
    end
  end
end
