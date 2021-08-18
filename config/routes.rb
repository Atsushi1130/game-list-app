Rails.application.routes.draw do
  # search controller
  get "/search" => "search#search"
  get "/keyword/:keyword/detail/:title" => "search#detail"

  # users controller
  get "/" => "users#index"
  get "/signup" => "users#new"
  post "/users/create" => "users#create"
  get "/login_form" => "users#login_form"
  post "/login" => "users#login"
  get "/user/:id/edit" => "users#edit"
  get "/logout" => "users#logout"

  # posts controller
  get "/post/new/:title" => "posts#new"
  post "/post/create" => "posts#create"
  get "/post/:id/detail" => "posts#detail"
  get "/post/:id/delete" => "posts#delete"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
