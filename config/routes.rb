Rails.application.routes.draw do
  root "orders#new"
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  
end
