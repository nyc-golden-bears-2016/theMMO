Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "game#index"

  get    "/select" => "characters#select"
  patch "/characters/auto_save" => 'characters#auto_save'
  patch  "/characters" => "characters#update"
  get "/game" => 'characters#game'
  get "instructions"=> 'characters#instructions'
  get "about" => 'characters#about'


  resources :characters, only: [:create, :game, :new, :update, :edit]

  resources :items, only: [:create]
end
