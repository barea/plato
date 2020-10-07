Rails.application.routes.draw do
  resources :invitations
  resources :tenants
  resources :subscriptions
  resources :plans
  resources :tasks
  resources :cards
  resources :boards do
    collection do
      get :calculate
    end
    collection do
      get :add_seat
    end
  end
  resources :organizations
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}

  root to: 'boards#index'
end
