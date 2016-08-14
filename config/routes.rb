Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "game#index"

  get "/game" => 'characters#game'
  resources :characters, only: [:create, :game, :new]
  resources :items, only: [:create]
end
