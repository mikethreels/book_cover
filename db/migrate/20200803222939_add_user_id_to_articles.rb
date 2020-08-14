class AddUserIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :book_articles, :user_id, :integer
  end
end
