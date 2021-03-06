Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root 'home#index'

  namespace :admin do
    resources :users, only: [ :index, :update ]

    mount ActionCable.server => '/cable'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
