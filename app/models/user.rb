class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
        
         
  # Validations
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_katakana, presence: true, format: { with: /\A[\p{Hiragana}\p{Katakana}\p{Han}]+\z/, message: "は全角（漢字、ひらがな、カタカナ）で入力してください" }
  validates :last_name_katakana, presence: true, format: { with: /\A[\p{Hiragana}\p{Katakana}\p{Han}]+\z/, message: "は全角（漢字、ひらがな、カタカナ）で入力してください" }
  validates :date_of_birth, presence: true

  # Associations
  has_many :items
  has_many :orders
end

