lass VotesController < ApplicationController
  def create
    @vote = current_user.likes.new(book_article_id: params[:book_article_id])

    if @vote.save
      redirect_to book_articles_path, notice: 'You liked a post.'
    else
      redirect_to book_articles_path, alert: 'You cannot like this post.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, post_id: params[:post_id])
    if vote
      vote.destroy
      redirect_to book_articles_path, notice: 'You disliked a post.'
    else
      redirect_to book_articles_path, alert: 'You cannot dislike post that you did not like before.'
    end
  end
end