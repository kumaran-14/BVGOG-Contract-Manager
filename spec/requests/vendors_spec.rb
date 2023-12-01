# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/vendors', type: :request do
    # This should return the minimal set of attributes required to create a valid
    # Vendor. As you add validations to Vendor, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) do
        {
          name: "Vendor 1"
          # Add other attributes as needed
        }
      end
      
      let(:invalid_attributes) do
        {
          name: nil
          # Add other attributes as needed
        }
      end

    describe 'GET /index' do
        it 'renders a successful response' do
            Vendor.create! valid_attributes
            get vendors_url
            expect(response).to be_successful
        end
    end

    describe 'GET /show' do
        it 'renders a successful response' do
            vendor = Vendor.create! valid_attributes
            get vendor_url(vendor)
            expect(response).to be_successful
        end
    end

    describe 'GET /new' do
        it 'renders a successful response' do
            get new_vendor_url
            expect(response).to be_successful
        end
    end

    describe 'GET /edit' do
        it 'renders a successful response' do
            vendor = Vendor.create! valid_attributes
            get edit_vendor_url(vendor)
            expect(response).to be_successful
        end
    end

    describe 'POST /create' do
        context 'with valid parameters' do
            it 'creates a new Vendor' do
                expect do
                    post vendors_url, params: { vendor: valid_attributes }
                end.to change(Vendor, :count).by(1)
            end

            it 'redirects to the created vendor' do
                post vendors_url, params: { vendor: valid_attributes }
                expect(response).to redirect_to(vendor_url(Vendor.last))
            end
        end

        context 'with invalid parameters' do
            it 'does not create a new Vendor' do
                expect do
                    post vendors_url, params: { vendor: invalid_attributes }
                end.to change(Vendor, :count).by(0)
            end

            it "renders a successful response (i.e. to display the 'new' template)" do
                post vendors_url, params: { vendor: invalid_attributes }
                expect(response).to have_http_status(:unprocessable_entity)
                expect(response).to render_template(:new)
                # post vendors_url, params: { vendor: invalid_attributes }
                # expect(response).to be_successful
            end
        end
    end

    describe 'PATCH /update' do
        context 'with valid parameters' do
            let(:new_attributes) do
                skip('Add a hash of attributes valid for your model')
            end

            it 'updates the requested vendor' do
                vendor = Vendor.create! valid_attributes
                patch vendor_url(vendor), params: { vendor: new_attributes }
                vendor.reload
                skip('Add assertions for updated state')
            end

            it 'redirects to the vendor' do
                vendor = Vendor.create! valid_attributes
                patch vendor_url(vendor), params: { vendor: new_attributes }
                vendor.reload
                expect(response).to redirect_to(vendor_url(vendor))
            end
        end

        context 'with invalid parameters' do
            it "renders a successful response (i.e. to display the 'edit' template)" do
                vendor = Vendor.create! valid_attributes
                patch vendor_url(vendor), params: { vendor: invalid_attributes }
                expect(response).to have_http_status(:unprocessable_entity)
                expect(response).to render_template(:edit)
                # expect(response).to be_successful
            end
        end
    end

    # describe 'DELETE /destroy' do
    #     it 'destroys the requested vendor' do
    #         vendor = Vendor.create! valid_attributes
    #         expect do
    #             delete vendor_url(vendor)
    #         end.to change(Vendor, :count).by(-1)
    #     end

    #     it 'redirects to the vendors list' do
    #         vendor = Vendor.create! valid_attributes
    #         delete vendor_url(vendor)
    #         expect(response).to redirect_to(vendors_url)
    #     end
    # end
end
