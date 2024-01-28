Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"

  resources :users

  resources :flats do
    resources :reservations
  end

  resources :reservations, only: [:new, :create, :destroy, :show, :edit]
end
