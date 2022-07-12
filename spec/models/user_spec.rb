require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、苗字、名前、苗字カナ、名前カナ、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      # 1.nickname空欄では登録できない
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      # 2.emailは空欄、重複、@を含まないアドレスだと登録できない
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      # 3.passwordは空欄、５文字以下、英数を含まないものでは登録できない
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'i2345'
        @user.password_confirmation = 'i2345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      # 4.password_confirmationはpasswordと一致しないと登録できない
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password_confirmation = 'i23456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      # 名前、カナ、生年月日が空では登録できない
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana is invalid')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      # 半角カナでは登録できない
      it 'last_nameが半角カナでは登録できない' do
        @user.last_name = 'ｻﾝﾌﾟﾙ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが半角カナでは登録できない' do
        @user.first_name = 'ｻﾝﾌﾟﾙ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_kanaが半角カナでは登録できない' do
        @user.last_name_kana = 'ｻﾝﾌﾟﾙ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが半角カナでは登録できない' do
        @user.first_name_kana = 'ｻﾝﾌﾟﾙ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      # 半角英語では登録できない
      it 'last_nameが半角英語では登録できない' do
        @user.last_name = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが半角英語では登録できない' do
        @user.first_name = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_kanaが半角英語では登録できない' do
        @user.last_name_kana = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが半角英語では登録できない' do
        @user.first_name_kana = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      # 半角数字では登録できない
      it 'last_nameが半角数字では登録できない' do
        @user.last_name = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが半角数字では登録できない' do
        @user.first_name = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_kanaが半角数字では登録できない' do
        @user.last_name_kana = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが半角数字では登録できない' do
        @user.first_name_kana = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      # 全角英語では登録できない
      it 'last_nameが全角英語では登録できない' do
        @user.last_name = 'ｓａｍｐｌｅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが全角英語では登録できない' do
        @user.first_name = 'ｓａｍｐｌｅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_kanaが全角英語では登録できない' do
        @user.last_name_kana = 'ｓａｍｐｌｅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが全角英語では登録できない' do
        @user.first_name_kana = 'ｓａｍｐｌｅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      # 全角数字では登録できない
      it 'last_nameが全角数字では登録できない' do
        @user.last_name = '１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが全角英語では登録できない' do
        @user.first_name = '１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_kana_kanaが全角数字では登録できない' do
        @user.last_name_kana = '１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが全角数字では登録できない' do
        @user.first_name_kana = '１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      # ひらがなでは登録できない
      it 'last_name_kana_kanaがひらがなでは登録できない' do
        @user.last_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaがひらがなでは登録できない' do
        @user.first_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      # 漢字では登録できない
      it 'last_name_kana_kanaが漢字では登録できない' do
        @user.last_name_kana = '試験'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが漢字では登録できない' do
        @user.first_name_kana = '試験'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
    end
  end
end
