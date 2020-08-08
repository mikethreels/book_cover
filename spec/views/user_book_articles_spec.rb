require 'rails_helper'

# rspec spec/views/user_spec.rb
RSpec.describe 'Main flow', type: :system do
  let(:test_user) { User.create(name: 'Example User', email: 'test@email.com', password: 'password') }
  let(:test_article) do
    test_user
    BookArticle.create(
        title: 'New artcle title', 
        text: 'New article text', 
        user_id: test_user.id
        ) 
  end
  let(:test_category) { Category.create(priority: 1, name: 'user_category') }
  let(:test_article) do
    test_user
    test_category
    BookArticle.create(
        title: 'New artcle title', 
        text: 'New article text', 
        user_id: test_user.id
        ) 
  end
  describe 'New user' do
    it 'User sign-up is correct' do
      # Access Home Page
      visit('/')

      # Go to Sign Up page
      click_link('SIGN UP')

      # Sign up
      sleep 1
      fill_in('user[name]', with: 'Test')
      fill_in('user[email]', with: 'test@email.com')
      fill_in('user[password]', with: 'password')
      fill_in('user[password_confirmation]', with: 'password')
      sleep 1
      click_button('Sign up')

      # Logout
      sleep 1
      click_link('SIGN OUT')
    end
  end
  # describe 'Friend request' do
  #   it 'path is correct' do
  #     test_friend
  #     test_user

  #     # Access Home Page
  #     visit('/')

  #     # Login as the user
  #     fill_in('user[email]', with: 'user@example.com')
  #     fill_in('user[password]', with: 'password')
  #     click_button('Log in')
  #     sleep 1

  #     # Go to all users page
  #     sleep 1
  #     click_link('All users')

  #     # Request a new friend
  #     sleep 1
  #     click_button('invite')

  #     # Logout
  #     sleep 1
  #     click_link('Sign out')

  #     # Login as the friend
  #     fill_in('user[email]', with: 'friend@example.com')
  #     fill_in('user[password]', with: 'password')
  #     click_button('Log in')
  #     sleep 1

  #     # Check my invitations
  #     click_link('My invitations')
  #     sleep 1
  #     click_button('Accept')
  #     sleep 1

  #     # Logout friend
  #     click_link('Sign out')
  #   end
  # end
  # describe 'create post' do
  #   it 'path is correct' do
  #     test_user

  #     # Access Home Page
  #     visit('/')

  #     # Login as the user
  #     fill_in('user[email]', with: 'user@example.com')
  #     fill_in('user[password]', with: 'password')
  #     click_button('Log in')
  #     sleep 1

  #     # Create a post
  #     fill_in('post[content]', with: 'this is an example post')
  #     sleep 1
  #     click_button('Save')

  #     # Comment on the post
  #     fill_in('comment[content]', with: 'this is an example comment')
  #     sleep 1
  #     click_button('Comment')

  #     # Like a post
  #     click_link('Like!')
  #     sleep 1

  #     # Logout
  #     click_link('Sign out')
  #   end
  # end
end
