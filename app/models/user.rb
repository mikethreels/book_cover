class User < ApplicationRecord
  has_many :book_articles
  has_many :votes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :book_articles
  has_many :votes, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 20, message: 'Username can have max 20 characters' }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Please enter a valid email' }
end
