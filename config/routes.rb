Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :book_articles do
    resources :votes, only: [:create, :destroy]
  end
  resources :categories, only: [:show]

  root 'book_articles#index'
end
