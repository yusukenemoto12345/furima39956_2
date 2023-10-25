class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 def first_name
 self[:first_name] # もしくは、self.first_name
 end
        
         
  # Validations
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_katakana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :last_name_katakana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :date_of_birth, presence: true

  # Associations
  has_many :items
  has_many :orders
end

