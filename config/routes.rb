Thiscloudlookslike::Application.routes.draw do
  root 'homes#show'

  get "/clouds/random" => "random_clouds#show"
  
  resources :clouds, only: [:show]
end
