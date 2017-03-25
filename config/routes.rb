Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
  get 'login' => :new
  post 'login' => :create
  delete 'logout' => :destroy
  end

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resources :orders
  resources :line_items
  resources :carts
  root to: 'store#index', as: 'store'

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

