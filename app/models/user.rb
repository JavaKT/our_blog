class User < ApplicationRecord
  validates :name, presence: true
  validates :kana, presence: true
  validates :birthday, presence: true
  validates :tell_no, presence: true, format: { with: /\d+-\d+-\d+/}


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
  has_many :posts

  
end
