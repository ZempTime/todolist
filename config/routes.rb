Todolist::Application.routes.draw do
  get "admin/index"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"

 controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  resources :lists do 
    resources :tasks
  end

   
  post 'lists/:id/edit', to: "lists#edit"

  post 'sessions/new', to: 'sessions#create'

  #post "/tasks", to: "tasks#create"
  #patch "/task/:id", to: "tasks#update", as: :task

  root to: "sessions#new"
end
