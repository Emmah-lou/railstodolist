Rails.application.routes.draw do
  root 'homepage#index'

  # Add routes below this line
  
  post '/tasks' => 'tasks#create'
  # delete '/tasks/:id' to: 'tasks#destroy'
  # put '/tasks/:id' to: 'tasks#update'
  # Add routes below above line

  # Redirect all other paths to index page, which will be taken over by AngularJS
  get '*path' => 'homepage#index'
end
