Rails.application.routes.draw do
  get 'search/jingles'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  namespace :users do
    resources :jingles
  end

  resources :jingles, only: [:show, :index] do
    member do
      get :buy
    end
  end

  root to: 'jingles#index'
end
