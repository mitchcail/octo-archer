Launchify::Application.routes.draw do
  

  resource :session

  get "sign_out" => "sessions#destroy"

  get "signup" => "users#new"
  resources :users

  root "posts#homepage"
 	
  get "homepage", to: "posts#homepage", as: "homepage"
  resources :posts do
  	resources :comments
    resources :likes
  end

  get "post/:id/delete", to: "posts#destroy", as: "post_delete"
end
