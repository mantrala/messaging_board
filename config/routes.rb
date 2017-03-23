Rails.application.routes.draw do
  resources :posts, only:[:index, :show, :new, :create]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

end
