class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  validates :password, presence: true, length: { minimum: 5}
  validates :nickname, presence: true
  validates :email, presence: true 
  validates :first_name, presence: true, format: {with: /[一-龥ぁ-ん]/}
  validates :family_name, presence: true
  validates :first_name_kana, presence: true, format: {with:/[\p{katakana}ー－&&[ -~｡-ﾟ]]+/}
  validates :family_name_kana, presence: true, format: {with:/[\p{katakana}ー－&&[ -~｡-ﾟ]]+/}
end

