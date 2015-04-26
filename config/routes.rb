Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "auth" }

  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  namespace :api do
    namespace :v1 do
      resources :books
      resources :medias
    end
  end

  # resources :books
  get "/*path", to: "books#index"
end
