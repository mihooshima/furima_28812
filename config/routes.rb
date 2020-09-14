Rails.application.routes.draw do
  devise_for :users
  #get 'articles/index'
  #get 'articles/new'
  root to: 'products#index'
  resources :products, only: [:index, :new, :create, :show, :edit, :update] do
  end


  end