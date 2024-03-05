# frozen_string_literal: true

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "pages#home"
  namespace :guests do
    resource :access, only: %i[create]
  end
  get "details", to: "pages#details"
  get "faq", to: "pages#faq"
  get "calendar", to: "pages#calendar", as: :calendar

  namespace :admin do
    get "/", to: "home#index"
    get  "sign_in", to: "sessions#new"
    post "sign_in", to: "sessions#create"
    resources :sessions, only: %i[index show destroy]
    resource  :password, only: %i[edit update]
    namespace :guests do
      resources :imports, only: %i[new create]
    end
    resources :guests
  end
end
