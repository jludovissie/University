Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :degrees
  get 'apply', to: 'students#new'
  get 'create-employee-account', to: 'admins#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'major', to: 'students#degree_list'
  post 'major', to: 'students#major_select'

  get 'login/faculty', to: 'sessions#new_faculty'
  post 'login/faculty', to: 'sessions#create_faculty'
  delete 'logout/faculty', to: 'sessions#destroy_faculty'

  post '/add-courses', to: 'courses#add_course_to_student' 

  resources :students, except: [:new]
  resources :courses 
  resources :admins, except: [:new]
 
end
