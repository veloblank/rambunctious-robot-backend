Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :reading_plans
      resources :searches
      resources :books
    end
  end
end
