Rails.application.routes.draw do

  resources :groups

  get 'quiz/:category_id/:group_id/:order_id' => 'quizzes#question'
  post 'quizzes/check/:id' => 'quizzes#check'
  resources :quizzes
  resources :categories
  get 'blogs/users'
  resources :blogs

  devise_for :users, controllers: {
   omniauth_callbacks: "users/omniauth_callbacks",
   sessions: 'users/sessions',
   registrations: 'users/registrations'
 }
  root to: 'home#top'
  get 'home/about'
  get 'home/index'
  get 'profile/:id' => 'home#profile'
  post'update/:id' => "home#update"

  post "/unsubscribe" =>"charges#unsubscribe"
  resources :charges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
