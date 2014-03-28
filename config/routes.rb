Mailer::Application.routes.draw do

  resources :students

  resources :parents

  resources :registrations

  devise_for :admins

  resources :events

  resources :contacts

  root :to => 'pages#home'

  get '/mathfestival', to: 'registrations#new'

end
