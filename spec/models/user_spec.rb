require 'rails_helper'

RSpec.describe User, type: :model do
  context 'バリデーションテスト' do
    it 'パスワードが半角英数字混合でなければ無効であること' do
      user = User.new(password: 'password')
      expect(user).not_to be_valid
    end

    it '姓が全角（漢字・ひらがな・カタカナ）でなければ無効であること' do
      user = User.new(last_name: 'Smith')
      expect(user).not_to be_valid
    end

    it '名が全角（漢字・ひらがな・カタカナ）でなければ無効であること' do
      user = User.new(first_name: 'John')
      expect(user).not_to be_valid
    end
  end
end






