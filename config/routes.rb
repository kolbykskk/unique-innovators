Rails.application.routes.draw do

  resources :entries do
    member do
      put "like", to: "entries#upvote"
      put "dislike", to: "entries#downvote"
    end
  end

  resources :bio

  post "/users/edit" => "bio#create"

  match '/contacts', to: 'contacts#new', via: 'get'

  resources "contacts", only: [:new, :create]

  resources :competitions, only: [:create, :delete, :show, :new, :update]

  scope :module => 'buttercms' do
    get '/categories/:slug' => 'categories#show', :as => :buttercms_category
    get '/author/:slug' => 'authors#show', :as => :buttercms_author

    get '/blog/rss' => 'feeds#rss', :format => 'rss', :as => :buttercms_blog_rss
    get '/blog/atom' => 'feeds#atom', :format => 'atom', :as => :buttercms_blog_atom
    get '/blog/sitemap.xml' => 'feeds#sitemap', :format => 'xml', :as => :buttercms_blog_sitemap

    get '/blog(/page/:page)' => 'posts#index', :defaults => {:page => 1}, :as => :buttercms_blog
    get '/blog/:slug' => 'posts#show', :as => :buttercms_post
  end

  devise_for :users, :controllers => { sessions: 'sessions' }
  get 'users/:id' => 'users#show', as: :user

  resources :receipts, only: [:update]

  resources :counter_offers, only: [:new, :create, :destroy, :update]

  resources :payouts, only: [:create, :update]

  devise_scope :user do
    get 'users/dashboard/:id' => 'sessions#dashboard'
  end

  resources :users do
    resources :gigs, shallow: true, except: [:index] do
       resources :favorites, only: [:create, :destroy]
       resources :reviews, except: [:update, :edit, :new]
    end
  end

  resources :conversations do
    resources :messages
  end

  resources :charges, only: [:new, :create]

  get 'gigs' => 'gigs#index'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
