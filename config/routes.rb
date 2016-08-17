Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "game#index"

  get "/game" => 'characters#game'
  get "instructions"=> 'characters#instructions'
   get "about" => 'characters#about'
  resources :characters, only: [:create, :game, :new]
  put "characters/update" => "characters#update"
  resources :items, only: [:create]
end
