Rails.application.routes.draw do
  root 'static_pages#home'

  get 'search', to: 'beers#index'
  get 'download', to: 'beers#download'
  get 'upvote/:id', to: 'beers#upvote', as: 'upvote'
  get 'downvote/:id', to: 'beers#downvote', as: 'downvote'

  resources :users, except: [:index, :destroy, :show]
  resources :beers, only: [:new, :create, :index]

  # Standard user sessions
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  # Facebook routes
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
