Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  # マイページのルーティング
  root to: 'homes#top'
  resources :users
  get 'users/:id/profile', to: 'users#show', as: 'user_profile'
  resources :homes, only: [:top, :about]
  get "home/about" => "homes#about"
  resources :books
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  get '/homes' => 'users#show'
  post 'users/:id/profile' => 'books#show'
end
