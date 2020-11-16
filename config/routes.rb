Rails.application.routes.draw do
resources :cars
  resources :pages
#  get '/search' => 'pages#index', :as => 'search_page'
#  resources :users do
#   resources :clients, type: 'Client'
 #  resources :suppliers, type: 'Supplier'
  #end

  

 # root to: 'pages#index'

  resources :clients

 # get 'search', to: 'pages#index'

  get 'search', to: 'pages#search'



  # resources :pages
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
