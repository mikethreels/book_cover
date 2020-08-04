class BookArticleCategory < ApplicationRecord
    belongs_to :category
    belongs_to :book_article
end
