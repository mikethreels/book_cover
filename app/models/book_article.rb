class BookArticle < ApplicationRecord
    belongs_to :user
    has_many :votes, dependent: :destroy
    has_many :book_article_categories, dependent: :destroy
    has_many :categories, through: :book_article_categories, dependent: :delete_all
    has_attached_file :image
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
    validates :text, presence: true, length: { maximum: 2000,
                                                too_long: '2000 characters in post is the maximum allowed.' }

    def self.most_popular
        if Vote.any?
            top_id = Vote.group(:book_article_id).count(:book_article_id).max_by { | _,v | v }[0]
            top_article = BookArticle.find(top_id)
        else
            top_article = BookArticle.first
        end
    end

    def self.top_category(cat) 
        category = Category.find(cat)
        category.book_articles.order("created_at DESC").first
    end

    def category_list
        categories.join(", ")
      end

    def category_list
        self.categories.collect do |category|
            category.name
        end.join(", ")
    end

    def category_list=(categories_string)
        category_names = categories_string.split(",").uniq
        new_or_found_categories= category_names.collect { |name| Category.find_or_create_by(name: name) }
        self.categories = new_or_found_categories
    end     
end
