Rails.application.routes.draw do
  root to: 'main#home'
  resources :services
  resources :vehicles
  resources :drivers
  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
