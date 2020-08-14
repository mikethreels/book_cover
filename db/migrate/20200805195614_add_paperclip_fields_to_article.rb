class AddPaperclipFieldsToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :book_articles, :image_file_name,    :string
    add_column :book_articles, :image_content_type, :string
    add_column :book_articles, :image_file_size,    :integer
    add_column :book_articles, :image_updated_at,   :datetime
  end
end
