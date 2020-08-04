class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :username, :name 
    rename_column :book_articles, :body, :text 
  end
end
