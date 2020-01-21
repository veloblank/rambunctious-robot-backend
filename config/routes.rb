Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :searches
      resources :books
    end
  end
end
