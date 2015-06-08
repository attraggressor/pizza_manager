require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  describe "index" do
    let!(:ingredient1) { Ingredient.create(name: "Oliwki") }
    let!(:ingredient2) { Ingredient.create(name: "Cebula") }
   
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the ingredients into @ingredients" do
      get :index
      expect(assigns(@ingredients)['ingredients']).to match_array([ingredient1, ingredient2])
    end
    
  end

  describe "show" do
    it 'renders ingredient' do
      ingredient = Ingredient.create(name: "Boczek") 
      get :show, id: ingredient.id 
      expect(response).to render_template :show 
    end
  end

  describe "new" do
    let(:ingredient) { Ingredient.new }
    it "exposes new ingredient" do
        expect(ingredient).to be_a_new(Ingredient)
    end
  end

  describe "create" do 
    let(:valid_params) { {"ingredient" => {"name"=>"Cebula"}} }
    let(:invalid_params) { {"ingredient" => {"name"=> nil}} }
  
    context 'with valid params' do
      it 'creates a new ingredient' do
        expect { post :create, valid_params }.to change(Ingredient, :count).by(1)
      end

      it "redirects to the new ingredient" do 
        post :create, valid_params 
        expect(response).to render_template :show 
      end 

    end

    context "with invalid attributes" do 
      it "does not save the new ingredient" do 
        expect { post :create, invalid_params }.to_not change(Ingredient, :count) 
      end 

      it "re-renders the new method" do 
        post :create, invalid_params  
        expect(response).to render_template :new 
      end
    end
  end
  
  describe "edit" do
    it "renders edit ingredient" do
    ingredient = Ingredient.create(name: "Boczek") 
      get :edit, id: ingredient.id 
      expect(response).to render_template :edit 
    end
  end

  describe "update" do
    it 'should update the article' do
      ingredient = Ingredient.create(name: "Boczek") 
      put :update, { id: ingredient.id, ingredient: { name: 'Lepszy Boczek' }}
      ingredient = Ingredient.last
      expect(ingredient.name).to eq('Lepszy Boczek')
    end
  end

  describe "delete" do
    before :each  do
      @ingredient = Ingredient.create!(name: "Cebula")
    end

   it "deletes ingredient" do 
    expect{ delete :destroy, id: @ingredient }
      .to change(Ingredient, :count)
      .by(-1) 
   end
  end

end
