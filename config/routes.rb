Rails.application.routes.draw do

  get 'users/show'

  get 'likes/index'

  resources :topics do
    resources :bookmarks, except: :index
  end

  resources :bookmarks, except: :index do
    resources :likes, only: [:index, :create, :destroy]
  end

  devise_for :users
  resources :users, only: [:show]

  get 'welcome/about'

  root 'welcome#index'

  post :incoming, to: 'incoming#create'
end
