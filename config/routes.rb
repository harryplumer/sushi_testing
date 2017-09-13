Rails.application.routes.draw do
  get 'sushi_rolls/index'

  get 'sushi_rolls/show'

  get 'sushi_rolls/edit'

  get 'sushi_rolls/new'

  devise_for :users
  resources :sushi_rolls
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
