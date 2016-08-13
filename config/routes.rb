Rails.application.routes.draw do
  resources :jingles

  root to: 'jingles#index'
end
