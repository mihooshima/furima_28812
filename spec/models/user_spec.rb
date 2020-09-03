require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー情報' do
    context '新規登録がうまくいくとき' do
      it "全ての値が入って登録できる" do
        user = FactoryBot.build(:user) 
    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do # Userのインスタンス生成
        @user.nickname = ""  # nicknameの値を空にする'
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        user = FactoryBot.build(:user)  # Userのインスタンス生成
        user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに一意性がないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは@を含む必要があること" do
        user = FactoryBot.build(:user) 
        user.email 
        @user.valid?
        expect(@user.errors.full_messages).to include（”Email is using ＠”）
      end
      context '新規登録がうまくいかない時' do
      it  "passwordが空では登録できない" do
        user = FactoryBot.build(:user) 
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
       end
      context '新規登録がうまくいかない時' do
      it "passwordが6文字以下であれば登録できない" do
        user = FactoryBot.build(:user) 
        @user.password = "aaaaaa"
        @user.password_confirmation ="aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (minimum is 5 characters)")
      end
      it "パスワードは半角英数字混合であること" do
        user = FactoryBot.build(:user) 
        @user.password = "AAAA"
        @user.password_confirmation 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is using half=width English number")
      end
      it "パスワードは確認用を含めて2回入力すること" do
        user = FactoryBot.build(:user) 
        @user.password =
        @user.password_confirmation =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is enterning twicw")
      end
    end
  end
end