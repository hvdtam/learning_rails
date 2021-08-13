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

  resources :messages, only: [:new, :create]
  get 'users', to: 'users#index'
  root to: 'main#index'
  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resources :direct_messages

  get 'import', to: 'import#index'
  post 'import/execute', to: 'import#import'

  resources :posts do
    resources :comments
    # resources :likes, module: :posts
  end

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
