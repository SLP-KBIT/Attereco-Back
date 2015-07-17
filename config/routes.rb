Rails.application.routes.draw do
  devise_for :users
  mount AtterecoBack::API => '/api'
  root 'dashboards#index'
end
