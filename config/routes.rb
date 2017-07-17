Rails.application.routes.draw do
  get 'roadmap/index'

  get 'protected/index'

  resources :tasks
  get 'board/index'

  resources :backlogitems
  resources :sprints
  resources :projects
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
