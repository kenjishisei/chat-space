Rails.application.routes.draw do
  devise_for :users
  root 'message#index'
    resources :groups do
      resources :message
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
