Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/sign_out', to: "devise/sessions#destroy"
    delete '/cancel_account', to: 'registrations#cancel_account', as: 'cancel_account'

  end
  root 'landing#home'
  get '/home', to: 'passwords#index'
  resources :passwords, except: [:destroy]
  delete '/passwords/:id', to: 'passwords#destroy', as: 'delete_password'
end
