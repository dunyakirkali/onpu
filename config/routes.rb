Rails.application.routes.draw do
  devise_for :users
  resources :jingles

  root to: 'jingles#index'
end
