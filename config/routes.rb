Rails.application.routes.draw do
  root 'passwords#index'
  resources :passwords, except: [:destroy]
  delete '/passwords/:id', to: 'passwords#destroy', as: 'delete_password'
end
