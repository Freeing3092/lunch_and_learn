Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'recipes', to: 'country_recipes#index'
    end
  end
end
