Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  namespace :users do
    resources :jingles, except: [:index, :show] do
      resource :audio, except: [:index, :show, :destroy]
    end
  end

  resources :jingles, only: :show do
    member do
      get :buy
    end
  end

  get 'search/jingles'
  root to: 'search#jingles'
end
