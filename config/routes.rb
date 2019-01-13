Rails.application.routes.draw do
  root to: 'blogs#new'

  resources :blogs do
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]

  devise_for :users
  get 'users/:id' => 'users#show' #Mypageへのルーティング

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
