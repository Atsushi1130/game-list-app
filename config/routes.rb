Rails.application.routes.draw do
  # search controller
  get '/' => "search#index"
  get "/search" => "search#search"
  get "/keyword/:keyword/detail/:title" => "search#detail"

  # users controller
  get "/signup" => "users#new"
  post "/users/create" => "users#create"
  get "/login_form" => "users#login_form"
  post "/login" => "users#login"
  get "/user/:id/edit" => "users#edit"
  get "/logout" => "users#logout"

  # posts controller
  get "/post/new/:title" => "posts#new"
  post "/post/create" => "posts#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
