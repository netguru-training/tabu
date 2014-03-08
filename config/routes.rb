Rails.application.routes.draw do
  root :to => "hello#index"

  get 'results', to: 'games#results'
  
  resources :games
end
