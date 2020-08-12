class Category < ApplicationRecord
  has_many :book_article_categories
  has_many :book_articles, through: :book_article_categories, dependent: :delete_all

  def self.most_recent(category)
    category.book_articles.order('created_at DESC').limit(4)
  end

  def self.catgory_articles(category)
    category.book_articles.includes(:user, :categories).order("created_at DESC")
  end
end
