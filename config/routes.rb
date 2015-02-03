Rails.application.routes.draw do
  root 'static_pages#home'
  get 'signup' => 'users#new'

  # Facebook routes
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
