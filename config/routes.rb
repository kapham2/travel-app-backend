Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :user_destinations, only: [:index, :create, :update, :destroy]
      resources :follows, only: [:index, :create, :destroy]
      resources :destinations, only: [:show]
      post '/login', to: 'auth#login'
      get '/other-users/:id', to: 'users#show_other_user'
      get '/other-users-by-username/:username', to: 'users#show_other_users_by_username'
      get '/destinations-by-city/:city', to: 'destinations#show_destinations_by_city'
    end
  end
end
