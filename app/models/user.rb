class User < ApplicationRecord
  validates :name, presence: true, format: {with: /\A[一-龥]+\z/}
  validates :kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true
  validates :tell_no, presence: true, format: {with: /\A\d{3}-\d{4}-\d{4}\z/}
  validates :nickname, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  
end
