Thiscloudlookslike::Application.routes.draw do
  root 'random_clouds#show'

  get "/clouds/random" => "random_clouds#show"

  resources :clouds, only: [:show] do
    resources :comments, only: [:create]
  end
end
