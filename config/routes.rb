Rails.application.routes.draw do
  root 'welcome#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :guest, except: [:destroy, :new, :create]

  get '/welcome', to: 'welcome#show'
  get '/schedule', to: 'schedule#show'
  get '/family_schedule', to: 'itinerary#family'
  get '/lodging', to: 'lodging#show'
  get '/viva_mexico', to: 'mexico#show'
  get 'bridesmaid_center', to: 'bridesmaid#show'
  get 'bridesmaid_edit', to: 'bridesmaid#edit'
  patch 'bridesmaid_update', to: 'bridesmaid#update'
  put 'bridesmaid_update', to: 'bridesmaid#update'
  get '/registry', to: 'registry#show'
  get '/wedding_schedule', to: 'itinerary#show'
  get '/our_story', to: 'our_story#show'

  namespace :admin do
    get '/dashboard', to: 'users#show'
    resources :guest, only: [:update, :delete, :index]
  end
end
