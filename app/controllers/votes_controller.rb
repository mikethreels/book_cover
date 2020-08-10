class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(book_article_id: params[:book_article_id])

    if @vote.save
      redirect_to request.referrer, notice: 'You liked a post.'
    else
      redirect_to request.referrer, alert: 'You cannot like this post.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, book_article_id: params[:book_article_id])
    if vote
      vote.destroy
      redirect_to request.referrer, notice: 'You disliked a post.'
    else
      redirect_to request.referrer, alert: 'You cannot dislike post that you did not like before.'
    end
  end
end
