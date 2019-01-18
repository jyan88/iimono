Rails.application.routes.draw do
  root to: 'blogs#index'

  resources :blogs do
    resources :comments
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]

  devise_for :users

  resources :users, only: [:show, :edit, :destroy, :update]

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
