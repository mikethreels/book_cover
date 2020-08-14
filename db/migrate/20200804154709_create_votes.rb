class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :book_article_id
    end
    add_foreign_key :votes, :users, column: :user_id
    add_foreign_key :votes, :book_articles, column: :book_article_id
  end
end
