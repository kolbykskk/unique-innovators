Rails.application.routes.draw do

  devise_for :users, :controllers => { sessions: 'sessions' }

  devise_scope :user do
    get 'users/dashboard' => 'sessions#dashboard'
  end

  resources :users do
    resources :gigs, shallow: true, except: [:index] do
       resources :favorites, only: [:create, :destroy]
    end
  end

  resources :conversations do
    resources :messages
  end

  get 'gigs' => 'gigs#index'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
