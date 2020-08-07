Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :book_articles do 
    resources :votes
  end
  resources :categories
 
  root "book_articles#index"
end
