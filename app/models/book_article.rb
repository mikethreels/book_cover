class BookArticle < ApplicationRecord
    belongs_to :user
    has_many :votes, dependent: :destroy
    has_many :book_article_categories
    has_many :categories, through: :book_article_categories, dependent: :delete_all
    has_attached_file :image
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

    def self.most_popular
        top_id = Vote.group(:book_article_id).count(:book_article_id).max_by { | _,v | v }[0]
        top_article = BookArticle.find(top_id)
        
    end
end
