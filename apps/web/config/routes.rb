get "/", to: "connectors#index"

resources :connectors, only: [:index]
resources :plugins, only: [:index]
