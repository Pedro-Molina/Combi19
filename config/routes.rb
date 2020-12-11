Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/user', to:'users#index'
  get '/admin', to:'admins#index'
  get '/chofer', to:'chofers#index'
  devise_for :chofers
  devise_for :admins
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :pasajes
  resources :viajes
  get '/listaViajes', to: 'viajes#listaViajes'

  get '/compraExpressViaje', to: 'viajes#compraExpressViaje', as: 'compraExpressViaje'
  put '/compraExpressViaje/:id', to: 'viajes#expressUpdate', as: 'expressUpdate'

  get '/choferViajes', to: 'chofers#choferViajes'
  put '/choferViajes/:id', to: 'chofers#editarEstado', as: 'editarEstado'
  get '/listaPasajeros/:id', to: 'chofers#choferPasajeros', as: 'listaPasajeros'
  get '/preguntasCovid/:id', to: 'chofers#preguntasCovid', as: 'preguntasCovid'
  put '/actualizarDatos/:id', to: 'chofers#actualizarDatos', as: 'actualizarDatos'

  get '/review/:id', to: 'viajes#review', as: 'edit_review'
  put '/review/:id', to: 'pasajes#updateReview',as:'updateReview'

  get '/registroExpress', to: 'users#registroExpress', as: 'registroExpress'
  post '/crearExpress', to: 'users#crearExpress', as: 'crearExpress'

  #get '/admin/crear_chofer', to: 'chofers#new'
  post '/admin/chofers', to: 'chofers#create'
  root 'main#default'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
