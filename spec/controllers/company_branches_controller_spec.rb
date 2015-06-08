require 'rails_helper'

RSpec.describe CompanyBranchesController, type: :controller do

   describe "index" do
    let!(:company_branch1) { CompanyBranch.create!(name: "Pizzeria Kraków") }
    let!(:company_branch2) { CompanyBranch.create!(name: "Pizzeria Warszawa") }
    
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the products into @company_branches" do
      get :index
      expect(assigns(@company_branches)['company_branches']).to match_array([company_branch1, company_branch2])
    end
  
  end

  describe "show" do
    it 'renders company_branch' do
      company_branch = CompanyBranch.create!(name: "Pizzeria Wrocław") 
      get :show, id: company_branch.id 
      expect(response).to render_template :show 
    end
  end

  describe "new" do
    let(:company_branch) { CompanyBranch.new }
    it "exposes new company_branch" do
        expect(company_branch).to be_a_new(CompanyBranch)
    end
  end

  describe "edit" do
    it "renders edit product" do
    company_branch = CompanyBranch.create(name: "Pizzeria USA") 
      get :edit, id: company_branch.id 
      expect(response).to render_template :edit 
    end
  end

  describe "delete" do
    before :each  do
      @company_branch = CompanyBranch.create!(name: "Pizzeria Lwów")
    end

   it "deletes company_branch" do 
    expect{ delete :destroy, id: @company_branch }
      .to change(CompanyBranch, :count)
      .by(-1) 
   end
  end

end
