
Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: "home#index"
  resources :articles do 
    resources :votes, only: %i[create destroy]

  end
  resources :categories
  
end
