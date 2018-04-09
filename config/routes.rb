Rails.application.routes.draw do

  resources :gigs

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
