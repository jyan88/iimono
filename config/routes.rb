Rails.application.routes.draw do
  get 'blogs/index'
  resources :blogs
  devise_for :users
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  root 'blogs#index'
end
