Mailer::Application.routes.draw do

  resources :mailer_events

  resources :students

  resources :parents

  resources :registrations

  devise_for :admins, :skip => [:registrations]
    as :admin do
      get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
      put 'admins/:id' => 'devise/registrations#update', :as => 'admin_registration'
    end

  resources :events

  resources :contacts do
    collection { post :import }
  end

  get '/contacts/unsubscribe/:signature' => 'contacts#unsubscribe', as: 'unsubscribe'

  root :to => 'pages#home'

  get '/mathfestival', to: 'registrations#new'
  get '/CORIinvitational', to: 'pages#robotics'
  get '/email_confirmation', to: 'registrations#email_confirmation'
end
