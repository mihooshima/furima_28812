class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
      validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
      validates :password, length: { minimum: 5}
      validates :nickname, presence: true
      validates :email
      validates :first_name, format: {with: /[一-龥ぁ-ん]/}
      validates :family_name, format: {with: /[一-龥ぁ-ん]/}
      validates :first_name_kana, format: {with:/\A[ァ-ヶー－]+\z/}
      validates :family_name_kana, format: {with:/\A[ァ-ヶー－]+\z/}
end

end
