Rails.application.routes.draw do
  resources :tenants
  resources :subscriptions
  resources :plans
  resources :tasks
  resources :cards
  resources :boards
  resources :organizations
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}

  root to: 'home#index'
end
