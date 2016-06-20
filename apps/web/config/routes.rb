get "/", to: "connectors#index"

resources :connectors, only: [:index, :new, :create, :show]
resources :plugins, only: [:index]
