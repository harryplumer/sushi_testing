Rails.application.routes.draw do
  root 'sushi_rolls#index'
  devise_for :users
  resources :sushi_rolls
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
