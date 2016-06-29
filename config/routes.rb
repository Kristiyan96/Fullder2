Rails.application.routes.draw do
  devise_for :users

  resources :restaurants do
    resources :menus do
      patch :activate
    end

    resources :categories
    resources :meals
    resources :tables
  end

  resources :users do
    resources :carts
  end

  resources :carts do
    resources :orders
  end
end
