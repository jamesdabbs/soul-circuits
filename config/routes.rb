Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :playlists, only: [:new, :create, :show, :index, :update] do
    post :like

    # TODO: listen?

    collection do
      get :search
      get :sign
    end
  end

  root to: 'playlists#index'
end
