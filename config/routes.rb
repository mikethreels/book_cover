Rails.application.routes.draw do
  devise_for :users
  resources :book_articles
  root "book_articles#index"
end
