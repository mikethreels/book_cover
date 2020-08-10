module ApplicationHelper
  def like_or_dislike_btn(book_article)
    vote = Vote.find_by(book_article: book_article, user: current_user)
    if vote
      link_to('Dislike!', book_article_vote_path(id: vote.id, book_article_id: book_article.id), method: :delete)
    else
      link_to('Like!', book_article_votes_path(book_article_id: book_article.id), method: :post)
    end
  end
end
