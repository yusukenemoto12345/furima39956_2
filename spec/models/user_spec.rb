require 'rails_helper'

RSpec.describe User, type: :model do
  context '異常系' do
    it '生年月日が空だと登録できないこと' do
      user = User.new(first_name_katakana: 'タロウ', last_name_katakana: 'タナカ', email: 'test@example.com', password: 'password')
      expect(user).not_to be_valid
    end
  end
end












