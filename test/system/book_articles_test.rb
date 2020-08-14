require 'application_system_test_case'

class BookArticlesTest < ApplicationSystemTestCase
  setup do
    @book_article = book_articles(:one)
  end

  test 'visiting the index' do
    visit book_articles_url
    assert_selector 'h1', text: 'Book Articles'
  end

  test 'creating a Book article' do
    visit book_articles_url
    click_on 'New Book Article'

    fill_in 'Body', with: @book_article.body
    fill_in 'Title', with: @book_article.title
    click_on 'Create Book article'

    assert_text 'Book article was successfully created'
    click_on 'Back'
  end

  test 'updating a Book article' do
    visit book_articles_url
    click_on 'Edit', match: :first

    fill_in 'Body', with: @book_article.body
    fill_in 'Title', with: @book_article.title
    click_on 'Update Book article'

    assert_text 'Book article was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Book article' do
    visit book_articles_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Book article was successfully destroyed'
  end
end
