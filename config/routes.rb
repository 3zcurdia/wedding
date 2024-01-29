# frozen_string_literal: true

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "pages#home"
  get "details", to: "pages#details"

  namespace :admin do
    get  "sign_in", to: "sessions#new"
    post "sign_in", to: "sessions#create"
    resources :sessions, only: %i[index show destroy]
    resource  :password, only: %i[edit update]
  end
end
