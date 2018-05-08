Rails.application.routes.draw do

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
