Launchify::Application.routes.draw do
  
  root "posts#index"
 	
 	put "post/:id/upvote", to: "posts#upvote", as: "post_upvote"	
  resources :posts do
  	resources :comments
  end
end
