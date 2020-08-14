json.extract! book_article, :id, :title, :body, :created_at, :updated_at
json.url book_article_url(book_article, format: :json)
