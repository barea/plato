Rails.application.routes.draw do
  resources :invitations do
    collection do
      get :generate
      post :redeem
    end
  end
  resources :tenants
  resources :subscriptions do
    collection do
      get :manage
    end
  end
  resources :plans
  resources :tasks
  resources :cards
  resources :boards
  resources :organizations
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}

  root to: 'boards#index'
end
