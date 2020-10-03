Rails.application.routes.draw do
  resources :tasks
  resources :cards
  resources :boards
  resources :organizations
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'boards#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
