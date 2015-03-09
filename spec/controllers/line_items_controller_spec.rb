require 'spec_helper'

describe LineItemsController do
  describe "POST create" do
    context "with valid attributes" do
      it "adds new lineitem to the current cart and redirects to the store page" do
        product = create(:product)
        expect {post :create, product_id:product.id
          }.to change(LineItem, :count).by(1)

      end

      it "Redirects to the store page by adding one line-item to it" do
        product = create(:product)
        post :create, product_id:product.id
        expect(response).to redirect_to(store_url)
      end


      it "passes successfully by returning HTTP status 302" do
        product = create(:product)
        post :create, product_id:product.id
        expect(response).to have_http_status(302)
      end

    end

    # context "with invalid attributes" do

      # it "do not add new lineitem to the current cart" do
      #   expect {post :create, product_id:0
      #     }.to change(LineItem, :count).by(0)

      # end

      # it "Redirects to the current cart page by adding one line-item to it" do
      #   product = create(:product)
      #   post :create, product_id:product.id
      #   expect(response).to redirect_to(LineItem.last.cart)
      # end


      # it "passes successfully by returning HTTP status 302" do
      #   product = create(:product)
      #   post :create, product_id:product.id
      #   expect(response).to have_http_status(302)
      # end

    # end

  end


end

