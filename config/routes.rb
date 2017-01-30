Rails.application.routes.draw do
  devise_for :users
  root 'message#index'
  resources :groups, only: [:new, :create, :show, :edit, :update]
  resources :message
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
