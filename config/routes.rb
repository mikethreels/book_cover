Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :book_articles
  resources :categories
  root "book_articles#index"
end
