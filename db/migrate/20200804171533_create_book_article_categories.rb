class CreateBookArticleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :book_article_categories do |t|
      t.references :category, foreign_key: true
      t.references :book_article, foreign_key: true

      t.timestamps
    end
  end
end
