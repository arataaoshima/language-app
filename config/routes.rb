Rails.application.routes.draw do
  devise_for :users, controllers: {
   omniauth_callbacks: "users/omniauth_callbacks",
   sessions: 'users/sessions'
 }
  root to: 'home#top'
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
