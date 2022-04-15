Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :degrees
  get 'apply', to: 'students#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'major', to: 'students#degree_list'
  post 'major', to: 'students#major_select'

  resources :students, except: [:new]
  resources :courses 
 
end
