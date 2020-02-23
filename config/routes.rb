Rails.application.routes.draw do

  get 'blogs/users'
  resources :blogs

  devise_for :users, controllers: {
   omniauth_callbacks: "users/omniauth_callbacks",
   sessions: 'users/sessions'
 }
  root to: 'home#top'
  get 'home/about'
  get 'home/index'
  resources :charges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
