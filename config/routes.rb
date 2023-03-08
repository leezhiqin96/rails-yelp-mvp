Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :restaurants
  resources :restaurants do
    resources :reviews, only: %i[new create]
  end
end
