Rails.application.routes.draw do
  get 'blogs/index'

  resources :blogs do
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]

  resources :users

  devise_for :users
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'blogs#index'
end
