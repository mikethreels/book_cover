require 'rails_helper'

RSpec.describe BookArticle do
  let(:test_user) { User.create(name: 'Example User', email: 'test@example.com', password: 'password') }
  let(:article) do
    described_class.new(
      title: 'New artcle title',
      text: 'New article text',
      user_id: test_user.id,
      image_file_name: "example.jpg",
      image_content_type: "image/jpg",
      image_file_size: "8192",
      image_updated_at: nil
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(article).to be_valid
    end

    it 'is not valid without text' do
      article.text = nil
      expect(article).to_not be_valid
    end

    it 'Text cannot be longer than 2,000' do
      article.text = '0' * 2001
      expect(article).to_not be_valid
    end
  end

  describe 'Associations', type: :model do
    it { should belong_to(:user) }
    it { should have_many(:votes) }
    it { should have_many(:book_article_categories) }
    it { should have_many(:categories) }
    it { should have_attached_file(:image) }
  end
end
