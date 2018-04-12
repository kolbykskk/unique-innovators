Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :gigs, shallow: true, except: [:index]
  end

  get 'gigs' => 'gigs#index'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
