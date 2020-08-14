require 'rails_helper'

RSpec.describe Category do
  let(:subject) do
    described_class.new(
      priority: 1,
      name: 'user_category'
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { should have_many(:book_article_categories) }
    it { should have_many(:book_articles) }
  end
end
