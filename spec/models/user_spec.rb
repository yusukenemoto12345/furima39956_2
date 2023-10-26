require 'rails_helper'

RSpec.describe User, type: :model do
  context '異常系' do
    it '生年月日が空だと登録できないこと' do
      user = build(:user, birth_date: nil)
      expect(user).not_to be_valid
    end
  end
end
