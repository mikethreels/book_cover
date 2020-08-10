require 'test_helper'

class BookArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_article = book_articles(:one)
  end

  test 'should get index' do
    get book_articles_url
    assert_response :success
  end

  test 'should get new' do
    get new_book_article_url
    assert_response :success
  end

  test 'should create book_article' do
    assert_difference('BookArticle.count') do
      post book_articles_url, params: { book_article: { body: @book_article.body, title: @book_article.title } }
    end

    assert_redirected_to book_article_url(BookArticle.last)
  end

  test 'should show book_article' do
    get book_article_url(@book_article)
    assert_response :success
  end

  test 'should get edit' do
    get edit_book_article_url(@book_article)
    assert_response :success
  end

  test 'should update book_article' do
    patch book_article_url(@book_article), params: { book_article: { body: @book_article.body, title: @book_article.title } }
    assert_redirected_to book_article_url(@book_article)
  end

  test 'should destroy book_article' do
    assert_difference('BookArticle.count', -1) do
      delete book_article_url(@book_article)
    end

    assert_redirected_to book_articles_url
  end
end
