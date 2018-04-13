require 'rails_helper'

RSpec.describe GigsController, type: :controller do

  let(:user) { create(:user) }
  let(:gig) { create(:gig, user: user) }
  before(:each) do
    sign_in(user)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { user_id: user.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #new template" do
      get :new, params: { user_id: user.id }
      expect(response).to render_template(:new)
    end

    it "instantiates @gig" do
      get :new, params: { user_id: user.id }
      expect(assigns(:gig)).not_to be_nil
    end
  end

  describe "GET #create" do
    it "increases the number of gigs by 1" do
      expect{ post :create, params: { user_id: user.id, gig: { title: FFaker::Job.title[3..30], category: FFaker::Lorem.word, description: FFaker::Lorem.paragraph[50..500], delivery_time: '2 days', allow: "Online Only", gallery: ["test.png"] } } }.to change(Gig,:count).by (1)
    end

    it "assigns the new gig to @gig" do
      post :create, params: { user_id: user.id, gig: { title: FFaker::Job.title[3..30], category: FFaker::Lorem.word, description: FFaker::Lorem.paragraph[50..500], delivery_time: '1 day', allow: "Online or Meetups", location: FFaker::Address.city, gallery: ["test.png"] } }
      expect(assigns(:gig)).to eq user.gigs.last
    end

    it "redirects to the newly created gig" do
      post :create, params: { user_id: user.id, gig: { title: FFaker::Job.title[3..30], category: FFaker::Lorem.word, description: FFaker::Lorem.paragraph[50..500], delivery_time: '20 days', location: FFaker::Address.city, allow: "Meetups Only", gallery: ["test.png"] } }
      expect(response).to redirect_to Gig.last
    end

    it "fails if no location is set unless allow is set to online-only" do
      expect{ post :create, params: { user_id: user.id, gig: { title: FFaker::Job.title[3..30], category: FFaker::Lorem.word, description: FFaker::Lorem.paragraph[50..500], delivery_time: '2 days', allow: "Meetups Only", gallery: ["test.png"] } } }.to change(Gig,:count).by (0)
    end

    it "sets the latitude and longitude when given a location" do
      post :create, params: { user_id: user.id, gig: { title: FFaker::Job.title[3..30], location: "Binghamton NY, USA", category: FFaker::Lorem.word, description: FFaker::Lorem.paragraph[50..500], delivery_time: '1 day', allow: "Online or Meetups", gallery: ["test.png"] } }
      expect(user.gigs.last.latitude).to eq 42.09868669999999
      expect(user.gigs.last.longitude).to eq -75.91797380000001
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { user_id: user.id, id: gig.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit template" do
      get :edit, params: { user_id: user.id, id: gig.id }
      expect(response).to render_template(:edit)
    end

    it "assigns gig to be updated to @gig" do
      get :edit, params: { user_id: user.id, id: gig.id }
      expect(assigns(:gig).id).to eq gig.id
      expect(assigns(:gig).title).to eq gig.title
      expect(assigns(:gig).description).to eq gig.description
      expect(assigns(:gig).delivery_time).to eq gig.delivery_time
      expect(assigns(:gig).allow).to eq gig.allow
      expect(assigns(:gig).location).to eq gig.location
      expect(assigns(:gig).category).to eq gig.category
    end
  end

  describe "PUT #update" do
    it "updates the gig with the expected attributes" do
      new_title = FFaker::Job.title[3..30]
      new_description = FFaker::Lorem.paragraph[5..50]

      put :update, params: { user_id: user.id, id: gig.id, gig: { title: new_title, description: new_description } }
      expect(assigns(:gig).id).to eq gig.id
      expect(assigns(:gig).title).to eq new_title
      expect(assigns(:gig).description).to eq new_description
    end
  end

  describe "GET #destroy" do
    it "deletes the gig" do
      get :destroy, params: { id: gig.id }
      count = Gig.where({ id: gig.id }).count
      expect(count).to eq(0)
    end

    it "redirects to the user dashboard" do
      get :destroy, params: { id: gig.id }
      expect(response).to redirect_to gigs_path
    end
  end

  describe "GET #show" do
    it "returns http status of success" do
      get :show, params: { id: gig.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show, params: { id: gig.id }
      expect(response).to render_template :show
    end

    it "assigns wiki to @wiki" do
      get :show, params: { id: gig.id }
      expect(assigns(:gig)).to eq(gig)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns all gigs to @gigs" do
      get :index
      expect(assigns(:gigs)).to eq Gig.all
    end
  end

end
