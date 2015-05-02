FacebookLite::Application.routes.draw do
  resources :users, only: [:new, :create, :show, :index] do
    resources :posts, only: [:index, :create, :edit, :update]
  end

  resources :posts, only: [:edit, :update, :destroy]

  get '/login', to: 'sessions#new', as: :login
  get '/session', to: redirect('/login')
  delete '/logout', to: 'sessions#destroy', as: :logout
  resource :session, only: [:new, :create, :destroy]

  root 'welcome#home'
end
