Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :posts do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :destroy]
  get '/homes/about', to: 'homes#about', as: 'about'

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
