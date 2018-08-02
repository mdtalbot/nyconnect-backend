Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :create]
  # get '/users/', to: 'users#index'
  # get '/users/:id/', to: 'users#show'
  # post '/users/', to: 'users#create'

  # This is login:
  resources :sessions, only: [:create]
  # post '/sessions/', to: 'sessions#create'

  resources :rep_mails, only: [:index]
  # get '/snacks/', to: 'snacks#index'

  get '/rep_mail', to:"rep_mailer#rep_mailer"

end
