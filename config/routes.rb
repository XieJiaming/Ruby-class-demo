Rails.application.routes.draw do
  get '/boards', to: 'boards#index'

  get '/users/sign_in', to: 'sessions#new', as: 'session'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/users/sign_out', to: 'sessions#destroy', as: 'logout'
  
  get '/users/sign_up', to: 'registrations#new', as: 'registration'
  post '/users', to: 'registrations#create'

  # get '/users', to: 'users#index'
 
  resources :boards
  # resources :boards, path: 'ccc'
  # resources :boards, only: [:index, :show]
  # resources :boards, except: [:new, :create, :edit, :update, :destroy]


  # get '/', to: 'boards#index' # 首頁轉到boards action為index的頁面
  root 'boards#index' #首頁轉跳的特化寫法

  # post '/boards', to: 'boards#create'
end
