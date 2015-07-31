Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  mount AtterecoBack::API => '/api'
  root 'dashboards#index'

  namespace :admin do
    resources :users do
      post :lock, on: :member
      post :unlock, on: :member
    end
    resources :attends
    resources :schedules
  end
end
