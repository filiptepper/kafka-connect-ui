get "/", to: "connectors#index"

resources :connectors, only: [:index, :new, :create, :show, :destroy] do
  resource :status, only: [:show] do
    member do
      get :pause
      get :resume
      get :restart
    end
  end
end
resources :plugins, only: [:index]
