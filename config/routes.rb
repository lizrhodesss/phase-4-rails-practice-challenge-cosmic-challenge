Rails.application.routes.draw do
  resources :planets, only: [:index]
  resources :missions, only: [:index, :create]
  resources :scientists, only: [:index, :show, :create, :update, :destroy]
end
