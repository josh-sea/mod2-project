Rails.application.routes.draw do
  resources :systems
  resources :accounts
  resources :reps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
