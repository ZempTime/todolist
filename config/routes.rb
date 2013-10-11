Todolist::Application.routes.draw do
  resources :lists do 
    resources :tasks
  end
  
  post 'lists/:id/edit', to: "lists#edit"



  #post "/tasks", to: "tasks#create"
  #patch "/task/:id", to: "tasks#update", as: :task

  root to: "lists#index"
end
