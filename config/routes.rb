Rails.application.routes.draw do
  get '/user', to:'users#index'
  get '/admin', to:'admins#index'
  get '/chofer', to:'chofers#index'
  devise_for :chofers
  devise_for :admins
  devise_for :users

  #resources :chofers

  get '/admin/crear_chofer', to: 'chofers#new'
  post '/admin/chofers', to: 'chofers#create'
  root 'main#default'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
