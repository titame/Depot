require 'spec_helper'

describe CartsController do

  # describe "GET index" do
  #   it "assigns all carts as @carts" do
  #     cart = create(:cart)
  #     get :index
  #     expect(assigns(:carts)).to include cart
  #   end

  #   it "renders template 'index'" do
  #     cart = create(:cart)
  #     get :index
  #     expect(response).to render_template :index
  #   end
  # end

  describe "GET show" do
    it "assigns the requested cart as @cart" do
      cart = create(:cart)
      get :show, id: cart
      expect(assigns(:my_cart)).to eq(cart)
    end

    it "renders template 'show'" do
      cart = create(:cart)
      get :show, id: cart
      expect(response).to render_template :show
    end
  end

  # describe "GET new" do
  #   it "assigns a new cart as @cart" do
  #     get :new
  #     expect(assigns(:cart)).to be_a_new(Cart)
  #   end

  #   it "renders template new" do
  #     get :new
  #     expect(response).to render_template :new
  #   end
  # end

  # describe "GET edit" do
  #   it "assigns the requested cart as @cart" do
  #     cart = create(:cart)
  #     get :edit, id: cart
  #     expect(assigns(:cart)).to eq(cart)
  #   end

  #   it "renders template edit" do
  #     cart = create(:cart)
  #     get :edit, id: cart
  #     expect(response).to render_template :edit
  #   end
  # end

  # describe "POST create" do
  #   context "with valid params" do
  #     it "creates a new Cart" do
  #       expect {
  #         post :create, cart: attributes_for(:cart)
  #       }.to change(Cart, :count).by(1)
  #     end

  #     it "redirects to the created cart" do
  #       post :create, cart: attributes_for(:cart)
  #       expect(response).to redirect_to(Cart.last)
  #     end
  #   end
  # end


  describe "DELETE destroy" do
    before :each do
      @cart=create(:cart)
    end

    it "destroys the requested cart record" do
      session[:cart_id]=@cart.id
      expect{delete :destroy, id: @cart
        }.to change(Cart, :count).by(-1)
    end

    it "redirects to the products store index page" do
      delete :destroy, id: @cart
      expect(response).to redirect_to store_url
    end
  end

 end
