Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :user_destinations, only: [:index, :create, :update, :destroy]
      resources :follows, only: [:index, :create, :destroy]
      post '/login', to: 'auth#login'
      get '/other-users/:id', to: 'users#show_other_user'
    end
  end
end
