Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :jingles

  # Authenticated
  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end

  root to: 'jingles#index'
end
