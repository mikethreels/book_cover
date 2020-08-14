require 'rails_helper'

RSpec.describe User do
  let(:subject) do
    described_class.new(
      name: 'user_example',
      email: 'user@email.com',
      password: 'password'
    )
  end

  describe 'validations' do
    it 'is valid with valid attribute' do
      expect(subject).to be_valid
    end

    it 'The name of the user should exist' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'The name of the user should not be longer than 20 characters' do
      subject.name = '0' * 21
      expect(subject).to_not be_valid
    end

    it 'The email should exist' do
      subject.email = ''
      expect(subject).to_not be_valid
    end

    it 'The email should have the right format' do
      subject.email = 'hello'
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations', type: :model do
    it { should have_many(:book_articles) }
    it { should have_many(:votes) }
  end
end
