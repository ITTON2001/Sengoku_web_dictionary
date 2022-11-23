Rails.application.routes.draw do
  #postsのroute
  get 'posts/new' => "posts#new"
  get ':map_name/詳細' => "posts#index"
  get 'posts/:id' => "posts#show"
  get 'posts/:id/edit' => "posts#edit"
  post "posts/create" => "posts#create"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  #usersのroute
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  get "login" => "users#login_form"
  post "users/create" => "users#create"
  post "users/:id/update" => "users#update"
  post "login" => "users#login"
  get "logout" => "users#logout"

  #editのroute
  get "users/:id/edits/new" => "edits#new"
  get "edits/:id" => "edits#show"
  post "edits/create" => "edits#create"

  #likeのroute
  get "users/:id/likes" => "users#likes"
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  #homeのroute
  get '/' => "home#top"
  get "about" => "home#about"
  get "一覧" => "home#index"
  get "search" => "home#search"
  get "maps/:map_name" => "home#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
