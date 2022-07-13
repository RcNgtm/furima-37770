class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  VALID_PW = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password,
            format: {
              with: VALID_PW
            }
  validates :last_name, presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana, presence: true,
            format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true,
            format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date, presence: true

  # has_many :items
  # has_many :histories
end
