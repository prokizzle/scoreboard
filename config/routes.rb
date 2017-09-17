Rails.application.routes.draw do
    resources :points, only: [:create]
    resources :games, only: [:create, :show]
    resources :players, only: [:show]
end
