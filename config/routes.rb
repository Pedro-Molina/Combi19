Rails.application.routes.draw do
  get '/user', to:'users#index'
  get '/admin', to:'admins#index'
  get '/chofer', to:'chofers#index'
  devise_for :chofers
  devise_for :admins
  devise_for :users
  root 'main#default'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
