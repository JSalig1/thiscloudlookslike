Thiscloudlookslike::Application.routes.draw do
  root 'clouds#index'

  get "/clouds/ajax" => "clouds#ajax"

  resources :clouds, only: [:show, :new, :create, :ajax]
  resources :comments, only: [:create]
end
