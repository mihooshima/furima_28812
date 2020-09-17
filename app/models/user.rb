class User < ApplicationRecord
   has_one :address
   has_one :destination
   # with_options presence: true do
   #    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
   #    validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
   #    validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
   # end
   
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
     PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
     katakana = /[ァ-ヶ]+/
      validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
      # validates :password, length: { minimum: 5}
      validates :nickname
      validates :email
      validates :first_name, format: {with: /[一-龥ぁ-ん]/}
      validates :family_name
      validates :first_name_kana, format: {with:katakana}
      validates :family_name_kana,  format: {with:katakana}
   end
end
