Rails.application.routes.draw do
  # search controller
  get '/' => "search#index"
  get "/search" => "search#search"
  get "/keyword/:keyword/detail/:title" => "search#detail"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
