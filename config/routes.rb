Rails.application.routes.draw do

  get 'likes/index'

  resources :topics do
    resources :bookmarks, except: :index
  end

  resources :bookmarks, except: :index do
    resources :likes, only: [:index, :create, :destroy]
  end

  devise_for :users

  get 'welcome/about'

  root 'welcome#index'

  post :incoming, to: 'incoming#create'
end
