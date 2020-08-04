class BookArticle < ApplicationRecord
    belongs_to :user
    has_many :votes, dependent: :destroy
end
