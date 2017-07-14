Rails.application.routes.draw do
  get 'board/index'

  resources :backlogitems
  resources :projects
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
