Rails.application.routes.draw do
  root :to => "hello#index"
  resources :games
  get 'next_round', to: "game_cards#next_round", as: :next_round
end
