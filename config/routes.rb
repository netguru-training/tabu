Rails.application.routes.draw do

  root :to => "games#new"
  
  resources :games do
  	get :results
  end

  resources :cards
  
  match 'next_round', to: "game_cards#next_round", as: :next_round, via: [:get, :post]
end
