Launchify::Application.routes.draw do
  
  root "posts#index"
 
  resources :posts do
  	resources :comments
  end
end
