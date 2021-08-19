Rails.application.routes.draw do
  # search controller
  get "/search" => "search#search"
  get "/keyword/:keyword/detail/:aipId" => "search#detail"

  # users controller
  get "/" => "users#index"
  get "/signup" => "users#new"
  post "/users/create" => "users#create"
  get "/login_form" => "users#login_form"
  post "/login" => "users#login"
  get "/user/:id/edit" => "users#edit"
  get "/logout" => "users#logout"
  get "/user/:id/detail" => "users#detail"
  get "/user/:id/likes" => "users#likes"
  get "/necessary_login" => "users#nec_login"

  # posts controller
  get "/post/new/:aipId" => "posts#new"
  post "/post/create" => "posts#create"
  get "/post/:id/detail" => "posts#detail"
  get "/post/:id/delete" => "posts#delete"

  # likes controller
  post "/likes/post/:id/create" => "likes#create"
  post "/likes/post/:id/delete" => "likes#delete"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
