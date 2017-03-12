Rails.application.routes.draw do
  
  devise_for :users
  scope "/admin" do
    resources :users
  end
  root 'welcome#index'

  resources :tasks
  resources :workers
  resources :person_equipments
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
