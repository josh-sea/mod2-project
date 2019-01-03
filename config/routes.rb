Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :tests, except: [:index]
  resources :reports, except: [:index]
  resources :inspections, except: [:index]
  resources :systems, except: [:index]
  resources :accounts
  resources :reps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
