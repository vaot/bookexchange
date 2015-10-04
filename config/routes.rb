require 'sidekiq/web'

Rails.application.routes.draw do

  root to: 'books#index'

  devise_for :users, controllers: { omniauth_callbacks: 'auth' }

  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :books
      resources :medias
      resources :bids
      resources :notifications

      get 'search', to: 'search#search'
    end
  end

  # resources :books
  get '/*path', to: 'books#index'
end
