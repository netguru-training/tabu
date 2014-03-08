Rails.application.routes.draw do
  root :to => "hello#index"
  resources :games
end
