Rails.application.routes.draw do
  
  devise_for :users 

  get '/users/' , to: 'users#index'
  get '/users/:id' , to: 'users#show'

  resources :publications do
    resources :state_publications, only: [:create, :destroy, :update, :show]
  end

  resources :projects do
    resources :state_projects, only: [:create, :destroy, :update, :show]
  end 
  
  
  get 'publications/my_publications/:user_id', to: 'publications#my_publications'
  #get 'my_publications', to: 'publications#my_publications'

  get 'projects/my_projects/:user_id', to: 'projects#my_projects'

  get 'home/index'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
