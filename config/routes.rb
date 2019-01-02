Rails.application.routes.draw do
  resources :inspections, except: [:index]
  resources :systems, except: [:index]
  resources :accounts
  resources :reps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
