require 'rails_helper'

# rspec spec/views/user_spec.rb
RSpec.describe 'Main flow', type: :system do
  before(:each) do
    FactoryBot.create(:user)
    FactoryBot.create(:article1)
    FactoryBot.create(:article2)
    FactoryBot.create(:article3)
    FactoryBot.create(:article4)
    test_category1 = Category.create!(priority: 1, name: 'user_category1')
    test_category2 = Category.create!(priority: 2, name: 'user_category2')
    test_category3 = Category.create!(priority: 3, name: 'user_category3')
    test_category4 = Category.create!(priority: 4, name: 'user_category4')
    BookArticleCategory.create!(book_article_id: 1, category_id: test_category1.id)
    BookArticleCategory.create!(book_article_id: 2, category_id: test_category2.id)
    BookArticleCategory.create!(book_article_id: 3, category_id: test_category3.id)
    BookArticleCategory.create!(book_article_id: 4, category_id: test_category4.id)
  end
  describe 'New user' do
    it 'User sign-up is correct' do
      # Access Home Page
      visit root_url
      # sleep 1
      # Go to Sign Up page
      click_link('SIGN_UP')
      # Sign up
      sleep 3
      fill_in('user[name]', with: 'Test')
      fill_in('user[email]', with: 'test@admin.com')
      fill_in('user[password]', with: 'password')
      fill_in('user[password_confirmation]', with: 'password')
      # sleep 1
      click_button('Sign up')
      # sleep 1
      click_link('SIGN_OUT')
    end
  end
  describe 'Write an article' do
    it 'path is correct' do
      # Access Home Page
      visit('/')

      # Login as the user
      click_link('LOGIN')
      fill_in('user[email]', with: 'test@example.com')
      fill_in('user[password]', with: 'password')
      click_button('Log in')

      # Go to write article page
      click_link('WRITE')
      sleep 1
      fill_in('book_article[title]', with: 'test title')
      sleep 1
      fill_in('book_article[text]', with: 'test text for test article')
      sleep 1
      find('#book_article_category_list').find(:xpath, 'option[1]').select_option
      sleep 1
      attach_file('Image', 'spec/files/images/yourtestimg.jpg')
      click_button('Create Book article')
      click_link('SIGN_OUT')
    end
  end
end
