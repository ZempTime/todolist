Todolist::Application.routes.draw do
  resources :tasks

  #post "/tasks", to: "tasks#create"
  #patch "/task/:id", to: "tasks#update", as: :task

  root to: "tasks#index"
end
