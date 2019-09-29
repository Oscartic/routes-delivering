Rails.application.routes.draw do
  resources :services
  resources :vehicles
  resources :drivers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
