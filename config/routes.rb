Rails.application.routes.draw do
  devise_for :users
  resources :games do
    resources :comments
    resources :screenshots
  end
  root "games#index"
end
