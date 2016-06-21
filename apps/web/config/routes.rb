get "/", to: "connectors#index"

resources :connectors, only: [:index, :new, :create, :show, :destroy]
resources :plugins, only: [:index]
