Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
  end


end
