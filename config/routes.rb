Rails.application.routes.draw do
  root "boards#index"
  
  devise_for :users do
  resources :boards
  end

  resources :boards do
    resources :lists    
  end

  resources :lists do
    resources :tasks
  end
end
