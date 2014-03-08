Rails.application.routes.draw do
  root :to => "hello#index"

  get 'results', to: 'games#results'
  
  resources :games
  get 'next_round', to: "game_cards#next_round", as: :next_round
end
