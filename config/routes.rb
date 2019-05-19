Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users , :controllers => { registrations: 'registrations' }

  root 'products#index'
  resources :products do
    collection do
      get "order_history"
    end
  end
  resources :categories
  resources :order_items, only: [:create, :update, :destroy], format: :js
  post 'payments/verify' => "payments#verify"
  resource :cart, only: [:show]
  resources :payments, only: [:new, :create]
  devise_scope :user do
    get '/user_profile', :to => 'registrations#show'
  end
end
