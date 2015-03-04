Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :books
      resources :medias
    end
  end

  # resources :books
  get "/*path", to: "books#index"
end
