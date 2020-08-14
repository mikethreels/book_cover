class Vote < ApplicationRecord
  validates :user_id, uniqueness: { scope: :book_article_id }

  belongs_to :user
  belongs_to :book_article
end
