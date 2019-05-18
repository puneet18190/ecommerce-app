Rails.application.routes.draw do
  get 'products/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products do
    collection do
      get "order_history"
    end
  end
  resources :categories
  resources :order_items, only: [:create, :update, :destroy], format: :js
  resource :cart, only: [:show]
end
