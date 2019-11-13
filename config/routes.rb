Rails.application.routes.draw do
  root to: 'events#index'

  resources :info_forms, only: [:create]

  get '/:path/', to: 'events#index'
end
