class Category < ApplicationRecord
    has_many :book_article_categories
    has_many :book_articles, through: :book_article_categories, dependent: :delete_all
end
