Rails.application.routes.draw do
  resources :book_articles
  root "book_articles#index"
end
