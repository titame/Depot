require 'spec_helper'

describe ProductsController do

  describe 'GET index' do

    it 'assigns array of products to @products' do
      product=create(:product)
      get :index
      expect(assigns(:products)).to include product
    end

    it 'renders index of products' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do

    it 'assigns requested product to @product' do
      product=create(:product)
      get :show, id: product
      expect(assigns(:product)).to eq(product)
    end

    it 'renders show' do
      product=create(:product)
      get :show, id: product
      expect(response).to render_template(:show)
    end
  end

  describe 'GET edit' do

    it 'assigns product requested for edit to @product' do
      product=create(:product)
      get :edit, id: product
      expect(assigns(:product)).to eq(product)
    end

    it 'renders edit' do
      product=create(:product)
      get :edit, id: product
      expect(response).to render_template(:edit)
    end
  end

  describe 'GET new' do

    it 'assigns new product instance to @product' do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end

    it 'renders new' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do

    context "with valid attributes" do

      it "creates a new product in database" do
        expect {
          post :create, product: attributes_for(:product)
        }.to change(Product, :count).by(1)
      end

      it "assigns to @product and save a newly created @product as Product in database" do
        post :create, product: attributes_for(:product)
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it "redirects to the added product" do
        post :create, product: attributes_for(:product)
        expect(response).to redirect_to(Product.last)
      end

    end

    context "with invalid attributes" do

      it "do not create product without title" do
        expect {
          post :create, product: attributes_for(:invalid_product)
        }.to change(Product, :count).by(0)
      end

      it "do not add product to database because of invalid attributes" do
        post :create, product: attributes_for(:invalid_product)
        expect(assigns(:product)).to_not be_persisted
      end

      it "re-renders new page" do
        post :create, product: attributes_for(:invalid_product)
        expect(response).to render_template(:new)
      end

    end


  end

  describe "PUT update" do

    before :each do
      @product=create(:product, title: "coffee")
    end

    it "finds requested product in database" do
      put :update, id: @product, product: attributes_for(:product)
      expect(assigns(:product)).to eq(@product)
    end

    context "with valid attributes" do

      it "updates a requested product in database" do
        put :update, id: @product, product: attributes_for(:product, title: "coffee-bite")
        @product.reload
        expect(@product.title).to eq("coffee-bite")
      end

      it "redirects to the updated product" do
        put :update, id: @product, product: attributes_for(:product)
        expect(response).to redirect_to(@product)
      end

    end

    context "with invalid attributes" do

      it "do not update product without title" do
        put :update, id: @product, product: attributes_for(:invalid_product)
        @product.reload
        expect(@product.title).to_not eq("coffee-bite")

      end

      it "re-renders edit template" do
        put :update, id: @product, product: attributes_for(:invalid_product)
        expect(response).to render_template(:edit)
      end

    end


  end

  describe "DELETE destroy" do

    before :each do
      @product=create(:product)
    end

    it "destroys the requested product record" do
      expect{delete :destroy, id: @product
        }.to change(Product, :count).by(-1)
    end

    it "redirects to the products index" do
      delete :destroy, id: @product
      expect(response).to redirect_to products_url
    end

  end

end
