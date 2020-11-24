Rails.application.routes.draw do
  get '/boards', to: 'boards#index'

  # 會員
  resource :users, controller: 'registrations', only: [:create, :edit, :update] do 
    get '/sign_up', action: 'new'
  end
  #post '/users', to: 'registrations#create'  
  #get '/users/edit', to: 'registrations#edit', as: 'edit_registration'
  #put '/users/edit', to: 'registrations#update', as: 'update_registration'
  #get '/users/sign_up', to: 'registrations#new', as: 'registration'
  
  # 登入
  resource :users, controller: 'sessions', only: [] do
    get '/sign_in', action: 'new'
    post '/sign_in', action: 'create'
    delete '/sign_out', action: 'destroy'
  end
  # get '/users/sign_in', to: 'sessions#new', as: 'session'
  # post '/login', to: 'sessions#create', as: 'login'
  # delete '/users/sign_out', to: 'sessions#destroy', as: 'logout'
  
  resources :boards do
    resources :posts, shallow: true
  end






  # get '/users', to: 'users#index'
 
  resources :boards
  # resources :boards, path: 'ccc'
  # resources :boards, only: [:index, :show]
  # resources :boards, except: [:new, :create, :edit, :update, :destroy]


  # get '/', to: 'boards#index' # 首頁轉到boards action為index的頁面
  root 'boards#index' #首頁轉跳的特化寫法

  # post '/boards', to: 'boards#create'
end
