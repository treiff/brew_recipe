Rails.application.routes.draw do
  root 'static_pages#home'

  get 'search', to: 'beers#index'
  get 'download', to: 'beers#download'

  resources :users, except: [:index, :destroy, :show]
  resources :beers, only: [:new, :create, :index] do
    get 'upvote', to: 'votes#upvote', as: 'upvote'
    get 'downvote', to: 'votes#downvote', as: 'downvote'
  end

  # Standard user sessions
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  # Facebook routes
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
