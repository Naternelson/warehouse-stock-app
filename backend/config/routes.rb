Rails.application.routes.draw do
  get 'project/index'
  get 'project/create'
  get 'project/destroy'
  get 'project/show'
  resources :users, only: [:delete]
  post 'signup', to: "users#signup"
  post 'login', to: "auth#login"
end
