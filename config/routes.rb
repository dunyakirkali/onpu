Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  namespace :users do
    resources :jingles, except: [:index, :show]
    resources :audios, except: [:index, :show, :destroy, :update, :edit]
  end

  resources :jingles, only: :show do
    member do
      get :buy
    end
  end

  get 'search/jingles'
  root to: 'search#jingles'
end
