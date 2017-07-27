Rails.application.routes.draw do
  devise_for :users
  resources :games do
    resources :comments
  end
  root "games#index"
end
