Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'recipes', to: 'country_recipes#index'
      get 'learning_resources', to: 'learning_resources#show'
      post 'users', to: 'users#create'
      resources :favorites, only: [:create]
    end
  end
end
