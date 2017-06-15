Rails.application.routes.draw do

  root to: redirect('docs')

  resource :session, only: %i[new create destroy]
  resources :uploads, only: %i[new create]

  resources :checker, only: %i[show]

  resources :groups
  resources :users
  resources :docs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
