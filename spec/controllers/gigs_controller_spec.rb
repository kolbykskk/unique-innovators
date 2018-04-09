require 'rails_helper'

RSpec.describe GigsController, type: :controller do

  let(:user) { create(:user) }
  before(:each) do
    sign_in(user)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "instantiates @gig" do
      get :new
      expect(assigns(:gig)).not_to be_nil
    end
  end

  describe "GET #create" do
    it "increases the number of gigs by 1" do
      expect{ post :create, params: { gig: { title: FFaker::Lorem.sentence, category: FFaker::Lorem.word, location: FFaker::Address.city, description: FFaker::Lorem.paragraph, delivery_time: FFaker::Lorem.word } } }.to change(Gig,:count).by (1)
    end

    it "assigns the new gig to @gig" do
      post :create, params: { gig: { title: FFaker::Lorem.sentence, category: FFaker::Lorem.word, location: FFaker::Address.city, description: FFaker::Lorem.paragraph, delivery_time: FFaker::Lorem.word } }
      expect(assigns(:gig)).to eq Gig.last
    end

    it "redirects to the newly created gig" do
      post :create, params: { gig: { title: FFaker::Lorem.sentence, category: FFaker::Lorem.word, location: FFaker::Address.city, description: FFaker::Lorem.paragraph, delivery_time: FFaker::Lorem.word } }
      expect(response).to redirect_to Gig.last
    end
  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
