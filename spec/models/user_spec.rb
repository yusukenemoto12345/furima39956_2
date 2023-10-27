require 'rails_helper'

RSpec.describe User, type: :model do
  describe '異常系' do
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

