require 'rails_helper'

RSpec.describe BookArticleCategory do
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

  let(:subject) do
    test_article
    test_category
    described_class.new(
      book_article_id: test_article.id,
      category_id: test_category.id
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a book_article' do
      subject.book_article_id = ''
      expect(subject).to_not be_valid
    end

    it 'is not valid without a category' do
      subject.category_id = ''
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations', type: :model do
    it { should belong_to(:book_article) }
    it { should belong_to(:category) }
  end
end
