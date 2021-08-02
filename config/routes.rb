# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  resources :roles
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  get 'landing/index', to: 'landing#index'
  get 'about', to: 'about#index'

  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  get '/auth/twitter/callback', to: 'omniauth_callbacks#twitter'

  resources :twitter_accounts
  resources :tweets
  # resources :users_all
  get 'users_all', to: 'users_all#index'
  resources :messages, only: [:new, :create]
  get 'users', to: 'users#index'
  post 'users/import', to: 'users#import'
  get 'users/import', to: 'users#index'
  root to: 'main#index'
  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resources :direct_messages

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
