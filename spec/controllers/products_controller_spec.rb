require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

 describe "index" do
    let!(:product1) { Product.create!(name: "Pizza Romana") }
    let!(:product2) { Product.create!(name: "Pizza Warana") }
    
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the products into @products" do
      get :index
      expect(assigns(@products)['products']).to match_array([product1, product2])
    end
  
  end

  describe "show" do
    it 'renders product' do
      product = Product.create(name: "Pizza Wojtka") 
      get :show, id: product.id 
      expect(response).to render_template :show 
    end
  end

  describe "new" do
    let(:product) { Product.new }
    it "exposes new product" do
        expect(product).to be_a_new(Product)
    end
  end

  describe "create" do 
    let(:valid_params) { {"product" => {"name"=>"Pizza Angielska"}} }
    let(:invalid_params) { {"product" => {"name"=> nil}} }

    context 'with valid params' do
      it 'creates a new product' do
        expect { post :create, valid_params }.to change(Product, :count).by(1)
      end

      it "redirects to the new product" do 
        post :create, valid_params 
        expect(response).to render_template :show 
      end 

    end

    context "with invalid attributes" do 
      it "does not save the new product" do 
        expect { post :create, invalid_params }.to_not change(Product, :count) 
      end 

      it "re-renders the new method" do 
        post :create, invalid_params  
        expect(response).to render_template :new 
      end
    end
  end
  
  describe "edit" do
    it "renders edit product" do
    product = Product.create(name: "Pizza Floriańska") 
      get :edit, id: product.id 
      expect(response).to render_template :edit 
    end
  end

  describe "update" do
    it 'should update the product' do
      product = Product.create(name: "Pizza Włoska") 
      put :update, { id: product.id, product: { name: 'Pizza Italiano' }}
      product = Product.last
      expect(product.name).to eq('Pizza Italiano')
    end
  end

  describe "delete" do
    before :each  do
      @product = Product.create!(name: "Pizza Obrzydliwa")
    end

   it "deletes product" do 
    expect{ delete :destroy, id: @product }
      .to change(Product, :count)
      .by(-1) 
   end
  end

end
