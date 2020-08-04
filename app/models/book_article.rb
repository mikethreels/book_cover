class BookArticle < ApplicationRecord
    belongs_to :user
    has_many :votes, dependent: :destroy
    has_many :book_article_categories
    has_many :categories, through: :book_article_categories, dependent: :delete_all
end
