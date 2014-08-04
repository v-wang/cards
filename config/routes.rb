Rails.application.routes.draw do



  devise_for :users
  resources :users
  get 'home/index'

  resources :projects do
    resources :cards, except: [:show, :index] do
      collection { post :sort } 
    end
  end

  root 'home#index'
end
