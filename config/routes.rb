Rails.application.routes.draw do
  devise_for :users
  resources :payments
  resources :cabins
  resources :rates
  resources :cars
  resources :people
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    authenticated :user do
      root "payments#index"
      #root "devise/sessions#destroy"
    end

    unauthenticated :user do
      root "devise/sessions#new", as: :user_unregistered
    end
  end
end
