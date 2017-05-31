Rails.application.routes.draw do
  
  devise_for :users
  scope "/admin" do
    resources :users
  end
  root :to => 'welcome#index'

  resources :tasks
  resources :workers
  resources :person_equipments

  resources :equipments, only: [:index] do
    collection do
      get 'catalogue'
    end
  end
  resources :equipment_orders
  resources :orders

  resources :reports, only: [:by_period, :by_sum, :by_worker] do
    collection do
      get 'by_period'
      get 'by_sum'
      get 'by_worker'
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
