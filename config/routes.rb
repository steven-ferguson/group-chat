XChat::Application.routes.draw do
  devise_for :users
  resources :chatrooms
  resources :participations

  root :to => "chatrooms#index"
end
