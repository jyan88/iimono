Rails.application.routes.draw do
  root to: 'blogs#index'

  resources :blogs do
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]

  resources :users, only: [:show]

  devise_for :users

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
