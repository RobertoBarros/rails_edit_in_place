Rails.application.routes.draw do
  devise_for :users

  resources :users, only: %i[edit update]

  root to: 'users#index'
end
