Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, except: %i(destroy show) do
    resources :messages, only: %i(index create)
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
