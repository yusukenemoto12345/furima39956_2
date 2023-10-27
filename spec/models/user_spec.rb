require 'rails_helper'

RSpec.describe User, type: :model do
  describe '正常系' do
  context'新規登録' do
    it '全ての項目が入力されていれば新規登録できること' do
     user = User.new(
        email: 'test@example.com',
       nickname: 'testuser',
        password: 'Test1234',
        password_confirmation: 'Test1234',
        last_name: '山田',
        first_name: '太郎',
        first_name_katakana: 'タロウ',
        last_name_katakana: 'ヤマダ',
        date_of_birth: Date.new(1990, 1, 1)
      )
      expect(user).to be_valid
    end
  end
end

  describe '異常系' do
    context 'メールアドレス登録' do
      it 'メールアドレスが空では登録できないこと' do
        user = User.new(email: '')
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it 'メールアドレスに@を含まない場合は登録できないこと' do
        user = User.new(email: 'invalid_email.com')
        user.valid?
        expect(user.errors[:email]).to include('is invalid')
      end
      it '重複したメールアドレスは登録できないこと' do
        existing_user = User.create(
          nickname: 'existinguser',
          first_name: '太郎',
          last_name: '山田',
          first_name_katakana: 'タロウ',
          last_name_katakana: 'ヤマダ',
          email: 'existing@example.com',
          password: 'password1',
          password_confirmation: 'password1',
          date_of_birth: Date.new(1990, 1, 1)
        )
  
        user = User.new(
          nickname: 'testuser',
          first_name: '太郎',
          last_name: '山田',
          first_name_katakana: 'タロウ',
          last_name_katakana: 'ヤマダ',
          email: 'existing@example.com',
          password: 'password2',
          password_confirmation: 'password2',
          date_of_birth: Date.new(1990, 1, 1)
        )
  
        user.valid?
        expect(user.errors[:email]).to include('has already been taken')
      end
    end
  end

  
  context 'パスワード登録' do
    it 'パスワードが空では登録できないこと' do
      user = User.new(password: '')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'パスワードが6文字未満では登録できないこと' do
      user = User.new(password: 'pass')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it '英字のみのパスワードでは登録できないこと' do
      user = User.new(password: 'password')
      user.valid?
      expect(user.errors[:password]).to include('は半角英数字混合で入力してください')
    end

    it '数字のみのパスワードでは登録できないこと' do
      user = User.new(password: '123456')
      user.valid?
      expect(user.errors[:password]).to include('は半角英数字混合で入力してください')
    end

    it '全角文字を含むパスワードでは登録できないこと' do
      user = User.new(password: 'パスワード123')
      user.valid?
      expect(user.errors[:password]).to include('は半角英数字混合で入力してください')
    end

    it 'パスワードとパスワード（確認用）が不一致だと登録できないこと' do
      user = User.new(password: 'password123', password_confirmation: 'password456')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end

  context '姓・名（全角）の登録' do
    it '姓（全角）が空だと登録できないこと' do
      user = User.new(last_name: '')
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it '姓（全角）に半角文字が含まれていると登録できないこと' do
      user = User.new(last_name: 'Yamada')
      user.valid?
      expect(user.errors[:last_name]).to include('は全角（漢字・ひらがな・カタカナ）で入力してください')
    end

    it '名（全角）が空だと登録できないこと' do
      user = User.new(first_name: '')
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it '名（全角）に半角文字が含まれていると登録できないこと' do
      user = User.new(first_name: 'Taro')
      user.valid?
      expect(user.errors[:first_name]).to include('は全角（漢字・ひらがな・カタカナ）で入力してください')
    end
  end

  context '姓・名（カナ）の登録' do
    it '姓（カナ）が空だと登録できないこと' do
      user = User.new(last_name_katakana: '')
      user.valid?
      expect(user.errors[:last_name_katakana]).to include("can't be blank")
    end

    it '姓（カナ）にカタカナ以外の文字が含まれていると登録できないこと' do
      user = User.new(last_name_katakana: 'やまだ')
      user.valid?
      expect(user.errors[:last_name_katakana]).to include('は全角（カタカナ）で入力してください')
    end

    it '名（カナ）が空だと登録できないこと' do
      user = User.new(first_name_katakana: '')
      user.valid?
      expect(user.errors[:first_name_katakana]).to include("can't be blank")
    end

    it '名（カナ）にカタカナ以外の文字が含まれていると登録できないこと' do
      user = User.new(first_name_katakana: 'たろう')
      user.valid?
      expect(user.errors[:first_name_katakana]).to include('は全角（カタカナ）で入力してください')
    end
  end

  context '生年月日の登録' do
    it '生年月日が空だと登録できないこと' do
      user = User.new(date_of_birth: nil)
      user.valid?
      expect(user.errors[:date_of_birth]).to include("can't be blank")
    end
  end
end

