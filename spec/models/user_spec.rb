require 'rails_helper'

RSpec.describe User, type: :model do
  context '異常系' do
    # (略)
    it '重複したメールアドレスは登録できないこと' do
      User.create(username: 'testuser1', email: 'test@example.com', password: 'password')
      user = User.new(username: 'testuser2', email: 'test@example.com', password: 'password')
      expect(user).not_to be_valid
    end

    it 'メールアドレスに@を含まない場合は登録できないこと' do
      user = User.new(username: 'testuser', email: 'invalid_email', password: 'password')
      expect(user).not_to be_valid
    end

    it 'パスワードが空では登録できないこと' do
      user = User.new(username: 'testuser', email: 'test@example.com', password: '')
      expect(user).not_to be_valid
    end

    # 他のテストも同様に続きます...

    it '生年月日が空だと登録できないこと' do
      user = User.new(username: 'testuser', email: 'test@example.com', password: 'password', birth_date: nil)
      expect(user).not_to be_valid
    end
  end
end




