Rails.application.routes.draw do
  devise_for :users
  mount AtterecoBack::API => '/api'
  root 'dashboards#index'

  namespace :admin do
    resources :users do
      post :lock, on: :member
      post :unlock, on: :member
    end
  end
end
