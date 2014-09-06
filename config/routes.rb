Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :playlists do
    post :like

    # TODO: listen?

    collection do
      get :search
    end
  end

  root to: "static_pages#home"
end
