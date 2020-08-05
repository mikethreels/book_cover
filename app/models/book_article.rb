class BookArticle < ApplicationRecord
    belongs_to :user
    has_many :votes, dependent: :destroy
    has_many :book_article_categories
    has_many :categories, through: :book_article_categories, dependent: :delete_all

    def self.most_popular
        top_id = Vote.group(:book_article_id).count(:book_article_id).max_by { | _,v | v }[0]
        top_article = BookArticle.find(top_id)
        
    end
end
