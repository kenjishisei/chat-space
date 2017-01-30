Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, except: [:destroy,]
  resources :message, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
