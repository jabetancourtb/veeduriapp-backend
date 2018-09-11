Rails.application.routes.draw do
  resources :state_projects
  resources :state_publications
  devise_for :users
  
  resources :projects

  resources :publications
  get 'publications/my_publications/:user_id', to: 'publications#my_publications'
  #get 'my_publications', to: 'publications#my_publications'

  get 'home/index'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
