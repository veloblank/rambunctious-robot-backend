Rails.application.routes.draw do
  resources :reading_plans
  resources :users
  resources :books
  namespace :api do
    namespace :v1 do
      resources :searches
    end
  end
end
