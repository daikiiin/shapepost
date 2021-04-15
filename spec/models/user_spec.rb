require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context "新規登録ができる時" do
      it '全ての項目を埋めれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = "111aaa"
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationの値が同じであれば登録できる" do
        @user.password = "111aaa"
        @user.password_confirmation = "111aaa"
        expect(@user).to be_valid
      end
    end
    context "新規登録ができない時" do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが英語のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'heightが空では登録できない' do
        @user.height = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Height can't be blank")
      end
      it "heightが数字でなければ登録できない" do
        @user.height = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Height is not a number")
      end
      it "heightが100より小さければ登録できない" do
        @user.height = "80"
        @user.valid?
        expect(@user.errors.full_messages).to include("Height must be greater than or equal to 100")
      end
      it "heightが1000より大きければ登録できない" do
        @user.height = "1002"
        @user.valid?
        expect(@user.errors.full_messages).to include("Height must be less than or equal to 1000")
      end
      it 'weightが空では登録できない' do
        @user.weight = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Weight can't be blank")
      end
      it "weightが数字でなければ登録できない" do
        @user.weight = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Weight is not a number")
      end
      it "weightが10000より大きければ登録できない" do
        @user.weight = "10002"
        @user.valid?
        expect(@user.errors.full_messages).to include("Weight must be less than or equal to 10000")
      end
      it 'ageが空では登録できない' do
        @user.age = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Age can't be blank")
      end
      it "ageが数字でなければ登録できない" do
        @user.age = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Age is not a number")
      end
      it "agetが200より大きければ登録できない" do
        @user.age = "201"
        @user.valid?
        expect(@user.errors.full_messages).to include("Age must be less than or equal to 200")
      end
      it "性別についての情報がなければ登録できない" do
        @user.sex_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Sex を選択して下さい")
      end
      it "運動頻度についての情報がなければ登録できない" do
        @user.training_status_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Training status を選択して下さい")
      end
      it "達成目標についての情報がなければ登録できない" do
        @user.training_goal_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Training goal を選択して下さい")
      end
     it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "emailに@マークがなければ登録できない" do
        @user.email = "aaaa.icloud.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordとpassword_confirmationの値が同じでなければ登録できない" do
        @user.password_confirmation = "111bbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
