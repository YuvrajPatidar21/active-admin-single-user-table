Rails.application.routes.draw do
  root "home#index"
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_scope :user do
    get '/users/sign_up', to: "user/registrations#new"
    post '/users', to: "user/registrations#create"
    get '/users/sign_in', to: "user/sessions#new"
    delete '/users/sign_out', to: "user/sessions#destroy"
    get 'users/forgot_password', to: "user/passwords#new"
  end
  resources :articles
end
