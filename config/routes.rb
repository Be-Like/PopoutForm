Rails.application.routes.draw do
  root to: 'events#index'

  get '/:path/', to: 'events#index'
end
