Rails.application.routes.draw do
  devise_for :users
  resources :groups, except: %i(destroy show) do
    resources :messages, only: %i(index create)
  end
  resources :users, only: %i(index)
  root 'groups#index'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
