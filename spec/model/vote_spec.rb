require 'rails_helper'

RSpec.describe Vote do
  let(:test_user) { User.create(name: 'Example User', email: 'test@example.com', password: 'password') }
  let(:test_post) { BookArticle.create(title: 'test title', text: 'this is a test post', user_id: test_user.id) }
  let(:subject) do
    described_class.new(
      book_article_id: test_post.id,
      user_id: test_user.id
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { should belong_to(:user) }
    it { should belong_to(:book_article) }
  end
end