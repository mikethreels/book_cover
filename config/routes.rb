Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :book_articles
  root "book_articles#index"
end
