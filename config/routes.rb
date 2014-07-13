Launchify::Application.routes.draw do
  resource :session

  get "sign_out" => "sessions#destroy"

  get "signup" => "users#new"
  resources :users

  root "posts#index"
 	
 	put "post/:id/upvote", to: "posts#upvote", as: "post_upvote"	
  resources :posts do
  	resources :comments
  end
end
