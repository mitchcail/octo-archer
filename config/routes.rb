Launchify::Application.routes.draw do
  

  resource :session

  get "sign_out" => "sessions#destroy"

  get "signup" => "users#new"
  resources :users

  root "posts#homepage"
 	
 	put "post/:id/upvote", to: "posts#upvote", as: "post_upvote"	
  get "homepage", to: "posts#homepage", as: "homepage"
  resources :posts do
  	resources :comments
    resources :likes
  end
end
