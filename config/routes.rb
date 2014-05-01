Launchify::Application.routes.draw do
  
  root "posts#index"
  get "posts" => "posts#index"
  get "posts/:id" => "posts#show", as: "post"
  get "posts/:id/edit" => "posts#edit", as: "edit_post"
end
