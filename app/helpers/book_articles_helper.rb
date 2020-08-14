module BookArticlesHelper
  def edit_button(user_id)
    edit_button = (link_to 'Edit', edit_book_article_path(@book_article.id)).html_safe
    return edit_button if user_id == current_user.id
  end

  def delete_button(user_id)
    delete_button = (link_to 'Delete', book_article_path(@book_article.id), method: :delete).html_safe
    return delete_button if user_id == current_user.id
  end
end
